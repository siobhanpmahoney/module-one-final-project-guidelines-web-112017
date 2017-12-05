class Artist
  attr_accessor :artistID, :artistName
end

class Podcast
  attr_accessor :podcastID, :podcastName,
  :rating
end

class Genre
  attr_accessor :genreID, :genreName
end

class Episodes
  attr_accessor :episode, :episodeId, :description, :length, :release_date
end