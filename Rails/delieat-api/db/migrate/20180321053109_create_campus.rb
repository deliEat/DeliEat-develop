class CreateCampus < ActiveRecord::Migration[5.1]
  def change
    create_table :campus do |t|
      t.belongs_to :restaurant
      t.string :name

      t.timestamps
    end
  end
end
