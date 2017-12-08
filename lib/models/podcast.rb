class Podcast < ActiveRecord::Base
  belongs_to :media_companies
  belongs_to :mediacompany
  has_many :podcastgenres
  has_many :genres, through: :podcastgenres
  has_many :episodes

  def avg_episode_length
    if self.episodes.count(:length) > 0
      answer = self.episodes.sum(:length) / self.episodes.count(:length)
      answer = answer / 1000 / 60
    else
      answer = 0
    end
    answer
  end
end
