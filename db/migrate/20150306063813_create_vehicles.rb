class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.integer :user_id
      t.string :category
      t.string :make
      t.string :model
      t.string :color
      t.integer :year
      t.string :owner
      t.integer :price
      t.string :address
      t.integer :zip
      t.string :state
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
