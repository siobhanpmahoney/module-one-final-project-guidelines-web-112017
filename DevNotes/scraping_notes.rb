

# TO FIND EPISODE INFO, FIRST ITERATE THROUGH BELOW iterable grouping of individual episodes
      # Nokogiri::HTML(RestClient.get(<URL>).css('div.tracklist-content-box tr.podcast-episode')
      # iterable grouping of individual episodes

  # FOR EACH INSTANCE, APPLY THESE ATTRIBUTES
      # episode.css("td.name span.text").text
      # episode title

      # episode.css("td.description span.text").text
      # episode description

      # episode.attributes["preview-duration"].value
      # episode duration (milliseconds)

      # episode.css("td.release-date span.text").text
      # episode date

# Podcast Rating
# Nokogiri::HTML(RestClient.get(<URL>).css('[itemprop=ratingValue]').inner_html
