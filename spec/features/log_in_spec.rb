feature 'Log in' do
  scenario 'a user can log in with the correct username and password' do
    user = User.create(username:'IdeasMan', email:'email@email.co.uk', password: 'pwpwpwpw')
    
    visit '/sessions/new'
    fill_in('username', with: 'IdeasMan')
    fill_in('password', with: 'pwpwpwpw')
    click_button('Sign in')

    expect(page).to have_content 'Proof that the route works'
  end
end