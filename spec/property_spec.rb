require_relative '../lib/property'

describe Property do
  describe '.all' do
    it 'shows a list of all properties' do
      expect(Property.all).to include 'Number 2, Flower Lane'
    end
  end
end