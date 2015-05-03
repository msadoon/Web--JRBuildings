class RemoveTaxesToHelps < ActiveRecord::Migration
  def change
  	remove_column :helps, :gst, :decimal
  	remove_column :helps, :qst, :decimal
  end
end
