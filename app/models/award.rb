class Award < ApplicationRecord
  validates_presence_of :name

  has_many :song_awards
  has_many :songs, through: :song_awards
end
