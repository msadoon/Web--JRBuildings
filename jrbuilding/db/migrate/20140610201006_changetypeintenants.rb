class Changetypeintenants < ActiveRecord::Migration
  def change
  	remove_column :tenants, :type, :boolean
    add_column :tenants, :type, :string
  end
end
