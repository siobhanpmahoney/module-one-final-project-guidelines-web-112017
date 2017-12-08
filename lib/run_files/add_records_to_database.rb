


def add_records_to_database
  results = JSON.parse(RestClient.get("https://itunes.apple.com/search?term=podcast&media=podcast&limit=50"))["results"]

  #iterate through results to create records
  results.each do |podcast_hash|
    create_podcast_with_hash(podcast_hash)
    add_podcast_episodes(podcast_hash["collectionViewUrl"], podcast_hash["collectionId"])
    create_genre_with_hash(podcast_hash)
    create_podcastgenre_with_hash(podcast_hash)
    create_mediacompany_with_hash(podcast_hash)
  end

end

def create_podcast_with_hash(podcast_hash)
  Podcast.find_or_create_by(name: podcast_hash["collectionName"], id: podcast_hash["collectionId"], mediacompany_id: podcast_hash["artistId"], rating: get_podcast_rating(podcast_hash["collectionViewUrl"]))
end

def create_genre_with_hash(podcast_hash)
  genres = podcast_hash["genres"]
  genreIds = podcast_hash["genreIds"]
  i = 0
  while i < genreIds.length
    Genre.find_or_create_by(name: genres[i], id: genreIds[i])
    i += 1
  end
end

def create_podcastgenre_with_hash(podcast_hash)
  podcast_hash["genreIds"].each do |genre_id|
    Podcastgenre.find_or_create_by(podcast_id: podcast_hash["collectionId"], genre_id: genre_id)
  end
end

def create_mediacompany_with_hash(podcast_hash)
  if !Mediacompany.all.any? {|inst| inst.id == podcast_hash["artistId"]}
    Mediacompany.create(name: podcast_hash["artistName"], id: podcast_hash["artistId"])
  end
end

def add_podcast_episodes(url, podcast_id)
  result = Nokogiri::HTML(RestClient.get("#{url}")).css('div.tracklist-content-box tr.podcast-episode')

  if result.length > 10
    result = result[0...10]
  end
  result.each do |episode|
    episode_hash = {
      name: episode.css("td.name span.text").text,
      description: episode.css("td.description span.text").text,
      release_date: episode.css("td.release-date span.text").text,
      podcast_id: podcast_id
    }
    length = episode.attributes["preview-duration"]
    length ? length = length.value : length
    episode_hash[:length] = length
    Episode.find_or_create_by(episode_hash)
  end
end



def get_podcast_rating(url)
  Nokogiri::HTML(RestClient.get("#{url}")).css('[itemprop=ratingValue]').inner_html
end

# binding.pry
# "word"
