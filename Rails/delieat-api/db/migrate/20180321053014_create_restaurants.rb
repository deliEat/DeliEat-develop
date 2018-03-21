class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.belongs_to :owner, index:true
      t.string :name
      t.integer :estimated_cook_time

      t.timestamps
    end
  end
end
