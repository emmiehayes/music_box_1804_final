require 'rails_helper'

describe Award, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it{should have_many(:songs).through(:song_awards)}
  end
end
