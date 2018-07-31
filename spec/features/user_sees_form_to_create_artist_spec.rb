require 'rails_helper'

describe 'user can create artist' do
  it 'by filling in a form' do
    artist_name = "Journey"

    visit new_artist_path

    fill_in :artist_name, with: artist_name

    click_on "Create Artist"

    expect(page).to have_content(artist_name)
  end
  it 'is blocked if data is bad' do
    visit new_artist_path

    click_on "Create Artist"

    expect(current_path).to eq(artists_path)
    expect(page).to have_button("Create Artist")
  end
end
