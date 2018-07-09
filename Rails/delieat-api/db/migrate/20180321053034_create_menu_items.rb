class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.belongs_to :menu, index: true
      t.string :name
      t.decimal :price, :precision => 8, :scale => 2
      t.string :description
      t.integer :estimated_cook_time

      t.timestamps
    end
  end
end
