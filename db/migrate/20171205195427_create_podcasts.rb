class CreatePodcasts < ActiveRecord::Migration[5.1]
  def change
    create_table :podcasts do |t|
      t.string :name
      t.float :rating
      t.integer :media_company_id
    end
  end
end
