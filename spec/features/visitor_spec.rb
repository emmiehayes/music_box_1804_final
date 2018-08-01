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

  it 'visits song index and sees awards for each song' do
    artist_1 = Artist.create(name: 'Journey')

    song_1 = artist_1.songs.create(title: "Don't Stop Believing", length: 320, play_count: 390808)
    song_2 = artist_1.songs.create(title: "Another Song", length: 320, play_count: 390808)

    award_1 = Award.create(name: 'Best')
    award_2 = Award.create(name: 'Worst')
    award_3 = Award.create(name: 'Best Artist')
    award_4 = Award.create(name: 'Most Annoying')

    SongAward.create(song: song_1, award: award_1)
    SongAward.create(song: song_1, award: award_2)
    SongAward.create(song: song_2, award: award_3)
    SongAward.create(song: song_2, award: award_4)

    visit songs_path

    expect(page).to have_content(song_1.title)
    expect(page).to have_content("Awards for #{song_1.title}:\n'Best' in '1997',\n'Worst in '1998'")
    expect(page).to have_content("Awards for #{song_2.title}:\n'Best Artist' in '1992',\n'Most Annoying in '1993'")
  end
end
