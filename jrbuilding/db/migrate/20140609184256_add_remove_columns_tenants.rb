class AddRemoveColumnsTenants < ActiveRecord::Migration
  def change
  	remove_column :tenants, :businessname, :string
  	add_column :tenants, :t_address, :string
  	add_column :tenants, :t_email, :string
  	add_column :tenants, :t_phone, :string
  	remove_column :tenants, :notes, :text
  	remove_column :tenants, :email, :string
  end
end
