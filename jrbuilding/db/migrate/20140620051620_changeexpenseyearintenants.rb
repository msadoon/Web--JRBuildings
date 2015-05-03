class Changeexpenseyearintenants < ActiveRecord::Migration
  def change
  	remove_column :tenants, :expenseyear, :integer
  	add_column :tenants, :expenseyear, :date
  end
end
