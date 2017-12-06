class CreatePodcastgenres < ActiveRecord::Migration[5.1]
  def change
    create_table :podcastgenres do |t|
      t.integer :podcast_id
      t.integer :genre_id
    end
  end
end
