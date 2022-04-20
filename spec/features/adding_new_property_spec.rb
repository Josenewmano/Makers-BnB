feature 'Adding a new property' do
  scenario ' A user can add a property to the Makersbnb' do
    visit '/listings/new'
    fill_in('name', with: 'Number 2, Flower Lane')
    click_button('Submit')
    expect(page).to have_content 'Number 2, Flower Lane'
  end
end