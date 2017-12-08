# def get_array_of_podcasts
#   query.

# #
#
# puts "name: string"
# puts "genre: string"
# puts "minimum_rating: integer (out of five)"
# puts "avg_episode_length: integer (minutes)"
# puts "mediacompany: string"
#

def convert_episode_length(answer)
  if answer > 0 && answer < 22
    answer = "15"
  elsif answer < 37
    answer = "30"
  elsif answer < 52
    answer = "45"
  elsif answer < 67
    answer = "60"
  else
    answer = "60+"
  end
end

def get_array_of_podcasts(hash)
  Podcast.all.select do |pod|
    if hash[:mediacompany] != "" && pod.mediacompany == nil
      false
    else
      (pod.name.downcase.include?(hash[:title].downcase) || hash[:title] == "") &&
        (convert_episode_length(pod.avg_episode_length) == convert_episode_length(hash[:avg_episode_length].to_i) || hash[:avg_episode_length] == "") &&
          ((hash[:mediacompany] == "" && pod.mediacompany == nil) || pod.mediacompany.name.downcase.include?(hash[:mediacompany].downcase) || hash[:mediacompany] == "" ) &&
            (pod.genres.each { |genre| genre.name.downcase.include?(hash[:genre].downcase) || hash[:genre] == "" }) &&
              (pod.rating >= hash[:minimum_rating].to_f || hash[:minimum_rating] == "")
      end
    end
  end




def get_array_of_episodes(hash)
  Episode.all.select do |ep|
    if hash[:mediacompany] != "" && ep.podcast.mediacompany == nil
      false
    else
      (ep.name.downcase.include?(hash[:title].downcase) || hash[:title] == "") &&
        (convert_episode_length(ep.podcast.avg_episode_length) == convert_episode_length(hash[:avg_episode_length].to_i) || hash[:avg_episode_length] == "") &&
          ((hash[:mediacompany] == "" && ep.podcast.mediacompany == nil) || ep.podcast.mediacompany.name.downcase.include?(hash[:mediacompany].downcase) || hash[:mediacompany] == "" ) &&
            (ep.podcast.genres.each { |genre| genre.name.downcase.include?(hash[:genre].downcase) || hash[:genre] == "" }) &&
              (ep.podcast.rating >= hash[:minimum_rating].to_f || hash[:minimum_rating] == "") &&
                (ep.description.downcase.include?(hash[:keyword].downcase) || hash[:keyword] == "")
      end
    end
end
