class User
  attr_reader :id, :username, :email, :password

  def initialize(id:, username:, email:, password:)
    @id = id
    @username = username
    @email = email
    @password = password
  end

  def self.create(username:, email:, password:)
    result = DatabaseConnection.query("INSERT INTO users(username, email, password) 
                                      VALUES($1, $2, $3) RETURNING id, username, email, password;", 
                                      [username, email, password])
    User.new(id: result[0]['id'], username: result[0]['username'], 
             email: result[0]['email'], password: result[0]['password'])
  end

  def self.authenticate(username:, password:)
    result = result = DatabaseConnection.query("SELECT * FROM users WHERE username = $1;", [username])
    return unless result.any?
    return unless result[0]['password'] == password
    User.new(id: result[0]['id'], username: result[0]['username'], 
             email: result[0]['email'], password: result[0]['password'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM users WHERE id = $1;", [id])
    User.new(id: result[0]['id'], username: result[0]['username'], 
             email: result[0]['email'], password: result[0]['password'])
  end
end
