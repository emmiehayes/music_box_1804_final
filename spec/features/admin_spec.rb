require 'rails_helper'

describe "Admin visits awards index" do
  it "sees what visitor sees plus form to create new award" do
    admin = User.create(username: "Dee", password: 'password', role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    award_1 = Award.create(name: 'Best')
    award_2 = Award.create(name: 'Worst')

    visit awards_path

    expect(page).to have_content('Best')
    expect(page).to have_content('Worst')
    expect(page).to have_content('Create A New Award')
    expect(page).to have_content('Name')
    expect(page).to have_button('Submit')
  end
end
