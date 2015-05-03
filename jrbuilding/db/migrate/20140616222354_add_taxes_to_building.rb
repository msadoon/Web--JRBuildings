class AddTaxesToBuilding < ActiveRecord::Migration
  def change
  	add_column :buildings, :gst, :decimal
  	add_column :buildings, :qst, :decimal
  	remove_column :tenants, :gst, :decimal
  	remove_column :tenants, :qst, :decimal
  end
end
