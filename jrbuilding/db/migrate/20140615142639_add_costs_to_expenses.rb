class AddCostsToExpenses < ActiveRecord::Migration
  def change
  	add_column :expenses, :item1, :string
  	add_column :expenses, :item2, :string
  	add_column :expenses, :item3, :string
  	add_column :expenses, :item4, :string
  	add_column :expenses, :item5, :string
  	add_column :expenses, :item6, :string
  	add_column :expenses, :item7, :string
  	add_column :expenses, :item8, :string
  	add_column :expenses, :item9, :string
  	add_column :expenses, :item10, :string
  	add_column :expenses, :cost1, :decimal
  	add_column :expenses, :cost2, :decimal
  	add_column :expenses, :cost3, :decimal
  	add_column :expenses, :cost4, :decimal
  	add_column :expenses, :cost5, :decimal
  	add_column :expenses, :cost6, :decimal
  	add_column :expenses, :cost7, :decimal
  	add_column :expenses, :cost8, :decimal
  	add_column :expenses, :cost9, :decimal
  	add_column :expenses, :cost10, :decimal
  	add_column :expenses, :yeartotal, :decimal
  	add_column :expenses, :year, :date
  end
end
