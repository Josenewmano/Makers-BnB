feature 'viewing properties' do
  scenario 'user can see a list of properties' do
    visit '/listings'
    
    expect(page).to have_content 'Number 2, Flower Lane'
    expect(page).to have_content 'The Penthouse'
    expect(page).to have_content 'Villa del Sol'
  end
end