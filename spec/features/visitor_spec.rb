require 'rails_helper'

describe "Visitor visits awards index" do
  it "sees awards that link to award show pages" do
    award_1 = Award.create(name: 'Best')
    award_2 = Award.create(name: 'Worst')

    visit awards_path

    expect(page).to have_content('Best')
    expect(page).to have_content('Worst')

    click_link 'Best'
    expect(current_path).to eq(award_path(award_1))
    expect(page).to have_content('Best')
    expect(page).to_not have_content('Worst')
  end

  it 'cannot see the create new award form for admin only' do
    award_1 = Award.create(name: 'Best')
    award_2 = Award.create(name: 'Worst')

    visit awards_path

    expect(page).to_not have_content('Create A New Award')
  end
end
