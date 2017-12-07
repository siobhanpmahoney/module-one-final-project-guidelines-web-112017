class CreatePodcasts < ActiveRecord::Migration[5.1]
  def change
    create_table :podcasts do |t|
      t.string :name
      t.float :rating
      t.integer :mediacompany_id
    end
  end
end
