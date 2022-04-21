feature 'Sign up' do
  scenario 'a user can sign up' do
    visit '/users/new'
    fill_in('username', with: 'NewUser')
    fill_in('email', with: 'newuser@email.com')
    fill_in('password', with: 'newpassword')
    click_button('Register')

    expect(page).to have_content 'Currently available properties'
  end
end