require_relative '../lib/property'

describe Property do
  describe '.all' do
    it 'shows a list of all properties' do
      connection = PG.connect(dbname: 'makers_bnb_test')
      connection.exec("INSERT INTO properties (name) VALUES('Number 2, Flower Lane');")
      connection.exec("INSERT INTO properties (name) VALUES('The Penthouse');")
      connection.exec("INSERT INTO properties (name) VALUES('Villa del Sol');")
      properties = Property.all
      expect(properties).to include 'Number 2, Flower Lane'
    end
  end

  describe '.create' do
    it 'creates a new property listing' do
      Property.create(name: 'The Cottage')
      expect(Property.all).to include 'The Cottage'
    end
  end
end