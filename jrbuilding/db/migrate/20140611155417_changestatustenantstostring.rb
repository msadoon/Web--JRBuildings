class Changestatustenantstostring < ActiveRecord::Migration
  def change
  	remove_column :tenants, :status, :boolean
    add_column :tenants, :status, :string
  end
end
