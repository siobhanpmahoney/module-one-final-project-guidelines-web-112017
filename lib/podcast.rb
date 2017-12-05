class Podcast < ActiveRecord::Base
  belongs_to :media_companies
  has_many :podcast_genres
  has_many :genres, through: :podcast_genres
  has_many :episodes
end
