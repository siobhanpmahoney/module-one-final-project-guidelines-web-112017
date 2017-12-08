
def cli_interface
  welcome
  input = ""
  while input != "exit"
    input = start_flow
    if input == "search"
      # user_input # method gets input from user. returns string of user input
      search = query_converter   # turning the string into hash from which all other methods will work from
      query_return_option(search)
    elsif input == "help"
      puts ""
      puts "Queries to this database can take multiple optional parameters in the form \"attribute: query_word\"."
      puts "These are the parameters:"
      puts ""
      puts "title: string"
      puts "genre: string"
      puts "minimum_rating: float (out of five)"
      puts "avg_episode_length: integer (minutes)"
      puts "mediacompany: string"
      puts "keyword: string"
      puts ""
      puts "Here is an example query:"
      puts "mediacompany: npr, keyword: supreme court, minimum_rating: 4.5"
      puts ""
      puts "This search would return all Podcasts or Episodes that match the keyword of supreme court, have an minimum rating of 4.5 stars, and were published by NPR."
      puts ""
    end
  end
  puts "Goodbye"
end

def start_flow
  puts "here are your options:"
  puts "search - searches for podcasts and episodes"
  puts "help - shows search options"
  puts "exit - leaves program"
  gets.chomp
end

def welcome
  puts "Welcome to the iTunes Podcast Database!"
  puts "This database contains information on podcasts published to iTunes."
  puts "Queries to this database can take multiple optional parameters in the form \"attribute: query_word\"."
  puts "These are the parameters:"
  puts ""
  puts "title: string"
  puts "genre: string"
  puts "minimum_rating: float (out of five)"
  puts "avg_episode_length: integer (minutes)"
  puts "mediacompany: string"
  puts "keyword: string"
  puts ""
  puts "Here is an example query:"
  puts "mediacompany: npr, keyword: supreme court, minimum_rating: 4.5"
  puts ""
  puts "This search would return all Podcasts or Episodes that match the keyword of supreme court, have an minimum rating of 4.5 stars, and were published by NPR."
  puts ""
end




def user_input
  puts "What would you like to search for?"
  input = gets.chomp
  input
end


def query_converter
  hash = {}
  user_input.split(", ").each do |element|
    hash[element.split(": ")[0].to_sym] = element.split(": ")[1]
  end

  if hash.keys != [:title, :mediacompany, :genre, :avg_episode_length, :minimum_rating, :keyword]
    6.times do
      if !hash.keys.include?(:title)
        hash[:title] = ""
      elsif !hash.keys.include?(:genre)
        hash[:genre] = ""
      elsif !hash.keys.include?(:minimum_rating)
        hash[:minimum_rating] = ""
      elsif !hash.keys.include?(:avg_episode_length)
        hash[:avg_episode_length] = ""
      elsif !hash.keys.include?(:mediacompany)
        hash[:mediacompany] = ""
      elsif !hash.keys.include?(:keyword)
        hash[:keyword] = ""
      end
    end
    hash.each do |k,v|
      if v.include?("\"")
        hash[k] = v.split("\"")[1]
      end
    end
  end

  hash
end


def query_return_option(search)
  puts "Would you like to see a list of episodes, podcasts, or try another search"
  input = gets.chomp
  if input.include?("episode")
      episodes = get_array_of_episodes(search)
      rated = sort_eps_by_rating(episodes)[0..4]
      dated = sort_eps_by_date(episodes)[0..4]
      puts ""
      puts "top #{rated.length} rated episodes that match the query"
      display_multiple_episodes(rated)
      puts ""
      puts "#{dated.length} most recent episodes that match the query"
      display_multiple_episodes(dated)
      puts "To see full list, enter 'list'. To make another query or exit this program, enter 'exit'."
      input = gets.chomp
      if input == "list"
        puts "top #{episodes.length} rated episodes that match the query"
        display_multiple_episodes(sort_eps_by_rating(episodes))
        puts ""
        puts "#{episodes.length} most recent episodes that match the query"
        display_multiple_episodes(sort_eps_by_date(episodes))
      end
  elsif input.include?("podcast")
    podcasts = get_array_of_podcasts(search)
    rated = sort_pods_by_rating(podcasts)[0..4]
    puts ""
    puts "top #{rated.length} rated episodes that match the query"
    display_multiple_podcasts(rated)
    puts ""
    puts "To see the full list, type 'list'. Otherwise, type 'exit' to make another query."
    input = gets.chomp
    if input == "list"
      puts "top #{podcasts.length} rated episodes that match the query"
      display_multiple_podcasts(sort_pods_by_rating(podcasts))
    end
  end
end


# TOP RATED METHODS

def sort_pods_by_rating(pod_filter)
  pod_filter.sort_by do |pod|
		pod.rating
	end.reverse
end

def sort_eps_by_rating(pod_filter)
  pod_filter.sort_by do |ep|
		ep.podcast.rating
	end.reverse
end

def sort_eps_by_date(episode_filter)
	episode_filter.sort_by do |ep|
    ep.release_date
  end
end



# FULL DISPLAY METHoDS

def display_multiple_podcasts(podcasts)

  podcasts.each_with_index do |pod, i|
    puts "--------#{i+1}.---------"
    display_podcast(pod)
    puts "--------------------"
    puts ""
  end
end

def display_podcast(pod)
  pod.mediacompany == nil ? media = "n/a" : media = pod.mediacompany.name

  puts "Podcast: #{pod.name}"
  puts "Media Company: #{media}"
  puts "Release Date of Most Recent Episode: #{pod.episodes.first.release_date}"
  puts "Average Length: #{pod.avg_episode_length} minutes"
  puts "Genres: #{pod.genres.map {|gen| gen.name}.join(", ")}"
  puts "Rating: #{pod.rating.round(1)} out of 5"
end

def display_multiple_episodes(episodes)

  episodes.each_with_index do |ep, i|
    puts "--------#{i+1}.---------"
    display_episode(ep)
    puts "--------------------"
    puts ""
  end
end

def display_episode(ep)
  puts "Episode Title: #{ep.name}"
  puts "Podcast name: #{ep.podcast.name}"
  puts "Media Company: #{ep.podcast.mediacompany.name}"
  puts "Release Date: #{ep.release_date}"
  puts "Length: #{convert_episode_length(ep.length)}"
  puts "Genres: #{ep.podcast.genres.map {|gen| gen.name}.join(", ")}"
end
