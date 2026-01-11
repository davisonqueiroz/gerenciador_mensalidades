class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.string :address
      t.string :adress_adjunct
      t.integer :address_number
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :neighborhood

      t.timestamps
    end
  end
end
