def welcome
  puts "Welcome to the iTunes Podcast Database!"
  puts "This database contains information on Media Companies, Podcasts, Episodes and Genres."
  puts "Queries to this database can take multiple optional parameters in the form of a hash. These are the parameters:"
  puts "title: string"
  puts "genre: string"
  puts "minimum_rating: integer (out of five)"
  puts "avg_episode_length: integer (minutes)"
  puts "media_company: string"
  puts "keyword: string"
  puts "Here is an example query:"
  puts "keyword: 'politics', avg_episode_length: 30, minimum_rating: 4"
  puts "This search would return all Podcasts and Episodes that match the keyword of politics, have an average episode length of 30 minutes, and have a rating of at least 4 stars."
end
#

def user_input
  puts "What would you like to search for?"
  input = gets.chomp
  query(input)
  puts "goodbye"
end


def query(input)
  puts input
end
