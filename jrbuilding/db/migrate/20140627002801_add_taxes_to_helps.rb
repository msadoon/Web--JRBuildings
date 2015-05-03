class AddTaxesToHelps < ActiveRecord::Migration
  def change
  	add_column :helps, :gst, :decimal
  	add_column :helps, :qst, :decimal
  end
end
