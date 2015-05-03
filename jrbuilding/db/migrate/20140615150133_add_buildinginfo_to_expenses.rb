class AddBuildinginfoToExpenses < ActiveRecord::Migration
  def change
  	add_column :expenses, :buildinginfo, :string
  end
end
