class Genre < ActiveRecord::Base
  has_many :podcastgenres
  has_many :podcasts, through: :podcastgenres
  has_many :media_companies, through: :podcastgenres
  has_many :episodes, through: :podcastgenres
end
