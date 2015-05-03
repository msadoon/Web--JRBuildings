class RenameNameAndNumberAndAddressFromBuildings < ActiveRecord::Migration
  def change
  	remove_column :buildings, :name, :string
    remove_column :buildings, :number, :string
    remove_column :buildings, :address, :text
    add_column :buildings, :streetno, :integer
    add_column :buildings, :streetname, :string
    add_column :buildings, :address, :string
  end
end
