class CreatePodcastGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :podcast_genres do |t|
      t.integer :podcast_id
      t.integer :genre_id
    end
  end
end
