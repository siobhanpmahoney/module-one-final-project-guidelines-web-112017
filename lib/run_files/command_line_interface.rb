def welcome
  puts "Welcome to the iTunes Podcast Database!"
  puts "This database contains information on Media Companies, Podcasts, Episodes and Genres."
  puts "Queries to this database can take multiple optional parameters in the form of a hash. These are the parameters:"
  puts ""
  puts "title: string"
  puts "genre: string"
  puts "minimum_rating: integer (out of five)"
  puts "avg_episode_length: integer (minutes)"
  puts "mediacompany: string"
  puts "keyword: string"
  puts ""
  puts "Here is an example query:"
  puts "mediacompany: new york times, keyword: news, avg_episode_length: 30, minimum_rating: 4"
  puts "This search would return all Podcasts and Episodes that match the keyword of politics, have an average episode length of 30 minutes, and have a rating of at least 4 stars."
end

def user_input
  puts "What would you like to search for?"
  input = gets.chomp
  # method gets input from user. returns string of user input
  input
end


def query_converter
  # string = user_input
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
    # hash.map do |k,v|
    #   v.include?("\"") ? v.split("\"")[1] : v
    # end
  end
  # turning the string into hash from which all other methods will work from
  hash
end



# def search
#   query_converter
#   #take hash of search, puts out in a readable format the podcasts and episodes related to search
#   # parse through data for result
#   get_array_of_podcasts(query_converter)
#   array_of_episodes = get_array_of_episodes(hash)
#   "SELECT name FROM podcasts WHERE rating > 4 #{minimum_rating} AND avg_episode_length == "



def search_return_top_rated_pods
  pod_filter.select #returns top 5 rated pods (based on pod_filter
end

def search_return_most_recent_pods
  pod_filter.select #returns 5 most recent (based on pod_filter
end

def search_return_top_rated_eps
  episode_filter.select #returns top 5 rated pods (based on pod_filter
end

def search_return_top_rated_eps
  episode_filter.select #returns 5 most recent epds
end

# def pod_filter_for_user_to_review #takes pod_filter instance array and converts into readable string for user
# end
#
# def ep_filter_for_user_to_review #takes ep_filter instance array and converts into readable string for user
# end


  # puts "top 5 highest rated podcasts that match the query"
  # puts "data result"
  #
  # puts "top 5 most recent podcasts that match the query"
  # puts "data result"
  #
  # puts "top 5 highest rated episodes that match the query"
  # puts "data result"
  #
  # puts "top 5 most recent episodes that match the query"
  # puts "data result"
  #  learn more options
