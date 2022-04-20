require 'pg'
class Property
  attr_reader :name, :description, :price_per_night

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else  
      connection = PG.connect(dbname: 'makers_bnb')
    end
    
    result = connection.exec("SELECT * FROM properties;")
    result.map { |property| property['name']}
  end

end