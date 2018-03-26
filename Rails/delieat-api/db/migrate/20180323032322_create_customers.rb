class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.belongs_to :user
      t.string :full_name
      t.integer :phone_number
      t.string :email

      t.timestamps
    end
  end
end
