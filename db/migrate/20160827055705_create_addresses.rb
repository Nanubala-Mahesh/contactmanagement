class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :Address
      t.string :country
      t.integer :contact_id

      t.timestamps
    end
  end
end
