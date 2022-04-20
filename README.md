# Makers-BnB

# in lib/bookmark.rb

require 'database_connection'

class Property
  def self.all
    result = DatabaseConnection.query("SELECT * FROM properties")
    result.map do |property|
      Property.new(
        id: property['id'],
        name: property['name'],
        description: property['description'],
        price_per_night property['price_per_night'],
      )
    end
  end

  def self.find(id:)
  end

  # rest of class

end