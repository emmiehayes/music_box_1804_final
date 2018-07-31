require 'rails_helper'

=begin
As a registered user
When I visit '/'
and I click on a link that says "I already have an account"
Then I should see a login form
and I can enter my username and password
and submit the form
and see a welcome message with my username
and my user ID is stored in a session
and I should no longer see the link that says "I already have an account"
and I should see a link that says "Log out"
=end
describe 'login workflow' do
  it 'allows registered users to log in successfully' do
    user = User.create(username: 'KeeganTwoWords', password: "test")

    visit root_path
    click_on 'I already have an account'
    expect(current_path).to eq(login_path)
    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"
    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Log Out")
    expect(page).to_not have_content("I already have an account")
  end
  it 'blocks unsuccessful logins' do
    user = User.create(username: 'KeeganTwoWords', password: "test")

    visit root_path
    click_on 'I already have an account'
    expect(current_path).to eq(login_path)
    fill_in :username, with: user.username
    fill_in :password, with: 'bad password'

    click_on "Log In"
    expect(current_path).to eq(login_path)
  end
  it 'allows registerd users to log out' do
    user = User.create(username: 'KeeganTwoWords', password: "test")

    visit root_path
    click_on 'I already have an account'
    expect(current_path).to eq(login_path)
    fill_in :username, with: user.username
    fill_in :password, with: user.password

    click_on "Log In"
    click_on "Log Out"
    expect(current_path).to eq(root_path)

    expect(page).to have_button("I already have an account")
  end
end
