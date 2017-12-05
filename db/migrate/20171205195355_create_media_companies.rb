class CreateMediaCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :media_companies do |t|
      t.string :name
    end
  end
end
