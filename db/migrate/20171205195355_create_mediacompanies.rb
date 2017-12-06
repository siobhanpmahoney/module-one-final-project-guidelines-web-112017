class CreateMediacompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :mediacompanies do |t|
      t.string :name
    end
  end
end
