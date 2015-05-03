class AddPrecisionToExpensetable < ActiveRecord::Migration
  def self.up
  	change_column :expenses, :cost1, :decimal, :precision => 50, :scale => 2
  	change_column :expenses, :cost2, :decimal, :precision => 50, :scale => 2
  	change_column :expenses, :cost3, :decimal, :precision => 50, :scale => 2
  	change_column :expenses, :cost4, :decimal, :precision => 50, :scale => 2
  	change_column :expenses, :cost5, :decimal, :precision => 50, :scale => 2
  	change_column :expenses, :cost6, :decimal, :precision => 50, :scale => 2
  	change_column :expenses, :cost7, :decimal, :precision => 50, :scale => 2
  	change_column :expenses, :cost8, :decimal, :precision => 50, :scale => 2
  	change_column :expenses, :cost9, :decimal, :precision => 50, :scale => 2
  	change_column :expenses, :cost10, :decimal, :precision => 50, :scale => 2
  end
end
