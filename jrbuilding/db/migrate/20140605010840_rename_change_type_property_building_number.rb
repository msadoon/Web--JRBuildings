class RenameChangeTypePropertyBuildingNumber < ActiveRecord::Migration
  def change
  	remove_column :properties, :buildingnumber, :integer
    add_column :properties, :buildinginfo, :string
  end
end
