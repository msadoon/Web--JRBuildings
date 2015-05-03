class ChangetypecolumnTenants < ActiveRecord::Migration
  def change
  	remove_column :tenants, :buildingnumber, :integer
    add_column :tenants, :buildinginfo, :string
  end
end
