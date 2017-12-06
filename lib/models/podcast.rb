class Podcast < ActiveRecord::Base
  belongs_to :media_companies
  has_many :podcastgenres
  has_many :genres, through: :podcastgenres
  has_many :episodes
end
