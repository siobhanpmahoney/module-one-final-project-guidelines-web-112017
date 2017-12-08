
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
      puts "Queries to this database can take multiple optional parameters in the form \"attribute: query_word\"."
      puts "These are the parameters:"
      puts ""
      puts "title: string"
      puts "genre: string"
      puts "minimum_rating: integer (out of five)"
      puts "avg_episode_length: integer (minutes)"
      puts "mediacompany: string"
      puts "keyword: string"
      puts ""
      puts "Here is an example query:"
      puts "mediacompany: npr, keyword: korea, avg_episode_length: 30"
      puts "This search would return all Podcasts and Episodes that match the keyword of korea, have an average episode length of 30 minutes, and were published by NPR."
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
  puts "minimum_rating: integer (out of five)"
  puts "avg_episode_length: integer (minutes)"
  puts "mediacompany: string"
  puts "keyword: string"
  puts ""
  puts "Here is an example query:"
  puts "mediacompany: npr, keyword: korea, avg_episode_length: 30"
  puts "This search would return all Podcasts and Episodes that match the keyword of korea, have an average episode length of 30 minutes, and were published by NPR."
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
      rated = search_return_top_rated_eps(episodes)
      dated = search_return_most_recent_eps(episodes)
      puts ""
      puts "top #{rated.length} rated episodes that match the query"
      display_multiple_episodes(rated)
      puts ""
      puts "#{dated.length} most recent episodes that match the query"
      display_multiple_episodes(dated)
      puts "To see full list, enter 'list'."
      input = gets.chomp
      if input == "list"
        puts "top #{episodes.length} rated episodes that match the query"
        display_multiple_episodes(episodes)
        puts ""
        puts "#{episodes.length} most recent episodes that match the query"
        display_multiple_episodes(episodes)
      end
  elsif input.include?("podcast")
    podcasts = get_array_of_podcasts(search)
    rated = search_return_top_rated_pods(podcasts)
    puts ""
    puts "top #{rated.length} rated episodes that match the query"
    display_multiple_podcasts(rated)
    puts ""
    puts "To see the full list, type 'list'. Otherwise, type 'exit' to make another query."
    input = gets.chomp
    if input == "list"
      puts "top #{podcasts.length} rated episodes that match the query"
      display_multiple_podcasts(podcasts)
    end
  end
end


# TOP RATED METHODS

def search_return_top_rated_pods(pod_filter)
  pod_filter.sort_by do |pod|
		pod.rating
	end[0..4]
end

def search_return_top_rated_eps(pod_filter)
  pod_filter.sort_by do |ep|
		ep.podcast.rating
	end[0..4]
end

def search_return_most_recent_eps(episode_filter)
	episode_filter[0..4]
end


# SUMMARY METHODS

def format_response_ep(array)
  array.each_with_index do |el, i|
    puts "#{i+1}. #{el.name} - #{el.podcast.name}"
  end
end

def format_response_pod(array)
  array.each_with_index do |el, i|
    if el.mediacompany != nil
      puts "#{i+1}. #{el.name} - #{el.mediacompany.name}"
    else
      puts "#{i+1}. #{el.name}"
    end
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
  puts "Podcast: #{pod.name}"
  puts "Media Company: #{pod.mediacompany.name}"
  puts "Release Date of Most Recent Episode: #{pod.episodes.first.release_date}"
  puts "Average Length: #{pod.avg_episode_length} minutes"
  puts "Genres: #{pod.genres.map {|gen| gen.name}.join(", ")}"
  puts "Rating: #{pod.rating} out of 5"
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
