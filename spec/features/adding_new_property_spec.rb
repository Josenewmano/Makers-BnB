feature 'Adding a new property' do
  scenario ' A user can add a property to the Makersbnb' do
    visit '/listings/new'
    fill_in('name', with: 'Number 2, Flower Lane')
    fill_in('description', with: 'A homely little cottage on a lane which lives up to its name, in a picture-postcard village')
    fill_in('price_per_night', with: 125)
    click_button('Submit this place')
    expect(page).to have_content 'Number 2, Flower Lane'
  end
end