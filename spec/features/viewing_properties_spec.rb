feature 'viewing properties' do
  scenario 'user can see a list of properties' do
    connection = PG.connect(dbname: 'makers_bnb_test')
    connection.exec("INSERT INTO properties (name) VALUES('Number 2, Flower Lane');")
    connection.exec("INSERT INTO properties (name) VALUES('The Penthouse');")
    connection.exec("INSERT INTO properties (name) VALUES('Villa del Sol');")
    
    visit '/listings'
    
    expect(page).to have_content 'Number 2, Flower Lane'
    expect(page).to have_content 'The Penthouse'
    expect(page).to have_content 'Villa del Sol'
  end
end