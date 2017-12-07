def welcome
  puts "Welcome to the iTunes Podcast Database!"
  puts "This database contains information on Media Companies, Podcasts, Episodes and Genres."
  puts "Queries to this database can take multiple optional parameters in the form of a hash. These are the parameters:"
  puts ""
  puts "title: string"
  puts "genre: string"
  puts "minimum_rating: integer (out of five)"
  puts "avg_episode_length: integer (minutes)"
  puts "media_company: string"
  puts "keyword: string"
  puts ""
  puts "Here is an example query:"
  puts "keyword: 'politics', avg_episode_length: 30, minimum_rating: 4"
  puts "This search would return all Podcasts and Episodes that match the keyword of politics, have an average episode length of 30 minutes, and have a rating of at least 4 stars."
end
#

def run_program
  input = user_input
  search(query_converter(input))
end

def user_input
  puts "What would you like to search for?"
  input = gets.chomp
<<<<<<< HEAD
  # input is a string, which needs to be converted to a hash
  # query(input)
  puts "goodbye"
=======
  # method gets input from user. returns string of user input
  input
end



def query_converter
  # string = user_input
  hash = {}
  user_input.split(", ").each do |element|
    hash[element.split(": ")[0].to_sym] = element.split(": ")[1]
  end
  hash
  # turning the string into hash from which all other methods will work from
>>>>>>> 8f07a1c3240bd08b88a99ce65046c1dce95077ae
end

# def search
#   query_converter
#   #take hash of search, puts out in a readable format the podcasts and episodes related to search
#   # parse through data for result
#   get_array_of_podcasts(query_converter)
#   array_of_episodes = get_array_of_episodes(hash)
#   "SELECT name FROM podcasts WHERE rating > 4 #{minimum_rating} AND avg_episode_length == "

def pod_filter
  hash = query_converter
  Podcast.all.select do |pod_obj|
    hash.each do |key, value|
      pod_obj[key] == value
    end
  end
end



def episode_filter
  #takes in search has, returns array of applicable episodes
end

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

def pod_filter_for_user_to_review #takes pod_filter instance array and converts into readable string for user
end

def ep_filter_for_user_to_review #takes ep_filter instance array and converts into readable string for user
end


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
