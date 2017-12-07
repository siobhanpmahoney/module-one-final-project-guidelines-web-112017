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

def user_input
  puts "What would you like to search for?"
  input = gets.chomp
  # input is a string, which needs to be converted to a hash
  # query(input)
  puts "goodbye"
end


def query(hash={})
  # parse through data for result
  array_of_podcasts = get_array_of_podcasts(hash)
  array_of_episodes = get_array_of_episodes(hash)

  puts "top 5 highest rated podcasts that match the query"
  puts "data result"

  puts "top 5 most recent podcasts that match the query"
  puts "data result"

  puts "top 5 highest rated episodes that match the query"
  puts "data result"

  puts "top 5 most recent episodes that match the query"
  puts "data result"
end

# what does learn more look like?1
