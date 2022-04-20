require_relative '../lib/property'

describe Property do
  describe '.all' do
    it 'shows a list of all properties' do
      connection = PG.connect(dbname: 'makers_bnb_test')
      connection.exec("INSERT INTO properties (name) VALUES('Number 2, Flower Lane');")
      connection.exec("INSERT INTO properties (name) VALUES('The Penthouse');")
      connection.exec("INSERT INTO properties (name) VALUES('Villa del Sol');")
      properties = Property.all
      expect(properties[0].name).to eq 'Number 2, Flower Lane'
    end
  end

  describe '.create' do
    it 'creates a new property listing' do
      property = Property.create(name: 'The Cottage', description: 'A cottage', price_per_night: 100)
      expect(property.name).to include 'The Cottage'
      expect(property.description).to include 'A cottage'
      expect(property.price_per_night).to include '100'
    end
  end
end