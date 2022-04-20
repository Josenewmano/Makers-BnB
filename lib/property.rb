require 'pg'
class Property
  attr_reader :id, :name, :description, :price_per_night

  def initialize(id:, name:, description:, price_per_night:)
    @id = id
    @name = name
    @description = description
    @price_per_night = price_per_night
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else  
      connection = PG.connect(dbname: 'makers_bnb')
    end
    
    result = connection.exec("SELECT * FROM properties;")
    result.map { |property| Property.new(id: property['id'], name: property['name'], description: property['description'], price_per_night: property['price_per_night'])
  }
  end

  def self.create(name:, description:, price_per_night:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makers_bnb_test')
    else  
      connection = PG.connect(dbname: 'makers_bnb')
    end
    result = connection.exec("INSERT INTO properties (name, description, price_per_night) VALUES('#{name}', '#{description}', '#{price_per_night}') RETURNING id, name, description, price_per_night")
    Property.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price_per_night: result[0]['price_per_night'])
  end

end