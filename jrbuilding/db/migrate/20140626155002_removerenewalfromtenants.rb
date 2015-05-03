class Removerenewalfromtenants < ActiveRecord::Migration
  def change
  	remove_column :tenants, :renewal, :boolean
  end
end
