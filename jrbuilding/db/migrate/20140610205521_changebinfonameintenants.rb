class Changebinfonameintenants < ActiveRecord::Migration
  def change
  	remove_column :tenants, :buildinginfo, :string
    add_column :tenants, :tenantbuildinginfo, :string
  end
end
