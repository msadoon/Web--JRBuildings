class Remove < ActiveRecord::Migration
  def change
  	remove_column :tenants, :status, :string
  end
end
