class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.belongs_to :restaurant, index: true
      t.string :food_type

      t.timestamps
    end
  end
end
