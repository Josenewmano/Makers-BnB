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
end