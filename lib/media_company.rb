class Media_Company < ActiveRecord::Base
  has_many :podcasts
  has_many :episodes, through: :podcasts
  has_many :podcast_genres, through: :podcasts
  has_many :genres, through: :podcasts
end
