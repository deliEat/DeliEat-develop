class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.belongs_to :restaurant, index: true
      t.string :street
      t.string :city
      t.string :country
      t.string :postal_code
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
