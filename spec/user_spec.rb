require_relative '../lib/user'

describe User do
  context '.create' do
    it 'creates a new instance of the user class' do
      user = User.create(username:'IdeasMan', email:'email@email.co.uk', password: 'pwpwpwpw')

      expect(user.username).to eq 'IdeasMan'
      expect(user.email).to eq 'email@email.co.uk'
    end
    it 'encrypts passwords using bcrypt' do
      expect(BCrypt::Password).to receive(:create).with('pwpwpwpw')

      user = User.create(username:'IdeasMan', email:'email@email.co.uk', password: 'pwpwpwpw')
    end
  end
  context '.authenticate' do
    it 'returns the correct user, if it exists' do
      user = User.create(username:'IdeasMan', email:'email@email.co.uk', password: 'pwpwpwpw')
      authenticated =  User.authenticate(username:'IdeasMan', password: 'pwpwpwpw')

      expect(authenticated.id).to eq user.id
    end
    it 'returns nil if the username does not exist' do
      user = User.create(username:'IdeasMan', email:'email@email.co.uk', password: 'pwpwpwpw')

      expect(User.authenticate(username:'ADifferentMan', password: 'pwpwpwpw')).to be_nil
    end
    it 'returns nil if the password is incorrect' do
      user = User.create(username:'IdeasMan', email:'email@email.co.uk', password: 'pwpwpwpw')

      expect(User.authenticate(username:'IdeasMan', password: 'notthepassword')).to be_nil
    end
  end
  context '.find' do
    it 'finds users by their id' do
      user = User.create(username:'IdeasMan', email:'email@email.co.uk', password: 'pwpwpwpw')
      result = User.find(user.id)

      expect(user.id).to eq result.id
      expect(user.username).to eq result.username
    end
  end
end