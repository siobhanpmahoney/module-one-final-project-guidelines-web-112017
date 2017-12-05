class Podcast_Genre < ActiveRecord::Base
  belongs_to :podcast
  belongs_to :genre
end
