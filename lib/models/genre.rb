class Genre < ActiveRecord::Base
  has_many :podcastgenres
  has_many :podcasts, through: :podcastgenres
end
