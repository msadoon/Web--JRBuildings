class Renametypeintenants < ActiveRecord::Migration
  def change
  	remove_column :tenants, :type, :string
    add_column :tenants, :ltype, :string
  end
end
