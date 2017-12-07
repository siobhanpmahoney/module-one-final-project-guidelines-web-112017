class Podcast < ActiveRecord::Base
  belongs_to :media_companies
  belongs_to :mediacompany
  has_many :podcastgenres
  has_many :genres, through: :podcastgenres
  has_many :episodes

  def avg_episode_length
    answer = self.episodes.sum(:length) / self.episodes.count(:length)
    answer = answer / 1000 / 60
    # convert_episode_length(answer)
  end

  # def convert_episode_length(answer)
  #   if answer > 0 && answer < 22
  #     answer = "15"
  #   elsif answer < 37
  #     answer = "30"
  #   elsif answer < 52
  #     answer = "45"
  #   elsif answer < 67
  #     answer = "60"
  #   else
  #     answer = "60+"
  #   end
  # end
end
