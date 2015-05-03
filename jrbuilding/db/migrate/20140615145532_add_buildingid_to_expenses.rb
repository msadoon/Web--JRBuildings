class AddBuildingidToExpenses < ActiveRecord::Migration
  def change
  	add_column :expenses, :building_id, :integer
  end
end
