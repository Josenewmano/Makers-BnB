require 'pg'
class Property
  attr_reader :name, :description, :price_per_night

  def self.all
    connection = PG.connect(dbname: 'makers_bnb')
    result = connection.exec("SELECT * FROM properties;")
    result.map { |property| property['name']}
  end

end