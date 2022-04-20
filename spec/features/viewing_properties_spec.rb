feature 'viewing properties' do
  scenario 'user can see a list of properties' do
    Property.create(name: 'Number 2, Flower Lane', 
                    description: 'A homely little cottage on a lane which lives up to its name, in a picture-postcard village',
                    price_per_night: "125")
    Property.create(name: 'The Penthouse',
                    description: "Who would not want to live in the top floor? Uber-stylish, uber-minimalist, uber-luxurious. Feel like you are on the top of the world, and actually be there!",
                    price_per_night: "275")
    Property.create(name: 'Villa del Sol',
                    description: 'Soak up the sun in your own little slice of paradise. Getting too hot? Slip into the private pool, or slip off your shirt if your prefer. Failing that, just follow the sea breeze and the sound of the waves to a perfectly secluded little cove',
                    price_per_night: '225')
    
    visit '/listings'
    
    expect(page).to have_content 'Number 2, Flower Lane'
    expect(page).to have_content 'The Penthouse'
    expect(page).to have_content 'Villa del Sol'
  end
end