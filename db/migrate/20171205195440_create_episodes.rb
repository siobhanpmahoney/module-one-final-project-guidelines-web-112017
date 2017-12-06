class CreateEpisodes < ActiveRecord::Migration[5.1]
  def change
    create_table :episodes do |t|
      t.string :name
      t.text :description
      t.integer :length
      t.string :release_date
      t.integer :podcast_id
    end
  end
end
