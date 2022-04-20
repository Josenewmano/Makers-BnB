class Property
  attr_reader :name, :description, :price_per_night

  def self.all
    @name = ['Number 2, Flower Lane', 'The Penthouse', 'Villa del Sol']
    @description = ['A homely little cottage on a lane which lives up to its name, in a picture-postcard village', "Who wouldn't want to live in the top floor? Uber-stylish, uber-minimalist, uber-luxurious. Feel like you're on the top of the world, and actually be there!", 'Soak up the sun in your own little slice of paradise. Getting too hot? Slip into the private pool, or slip off your shirt if your prefer. Failing that, just follow the sea breeze and the sound of the waves to a perfectly secluded little cove']
    @price_per_night = [125, 275, 225]
  end

end