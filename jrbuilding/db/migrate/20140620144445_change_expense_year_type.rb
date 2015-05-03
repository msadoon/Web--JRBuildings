class ChangeExpenseYearType < ActiveRecord::Migration
  def change
  	  	remove_column :tenants, :expenseyear, :date
  		add_column :tenants, :expenseyear, :string
  end
end
