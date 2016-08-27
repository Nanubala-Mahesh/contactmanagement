class ToChangeColumnName < ActiveRecord::Migration
  def change
  	remove_column :addresses, :Address
  	add_column :addresses, :address, :text

  end
end
