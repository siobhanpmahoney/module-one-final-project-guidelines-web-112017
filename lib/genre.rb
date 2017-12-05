class Genre < ActiveRecord::Base
  has_many :podcast_genres
  has_many :podcasts, through: :podcast_genres
  has_many :media_companies, through: :podcast_genres
  has_many :episodes, through: :podcast_genres
end
