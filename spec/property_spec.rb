require_relative '../lib/property'

describe Property do
  describe '.all' do
    it 'shows a list of all properties' do
      properties = Property.all
      expect(properties).to include 'Number 2, Flower Lane'
    end
  end
end