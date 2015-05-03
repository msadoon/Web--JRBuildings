class Addgstqsttotenants < ActiveRecord::Migration
  def change
  	add_column :tenants, :gst, :decimal
  	add_column :tenants, :qst, :decimal
  end
end
