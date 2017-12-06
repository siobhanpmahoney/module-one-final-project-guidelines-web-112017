class Podcastgenre < ActiveRecord::Base
  belongs_to :podcast
  belongs_to :genre
end
