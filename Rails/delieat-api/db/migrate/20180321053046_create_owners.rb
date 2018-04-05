class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.belongs_to :user
      t.string :full_name
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
