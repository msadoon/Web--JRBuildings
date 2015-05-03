class Changebackexpenseyear < ActiveRecord::Migration
  def change
  	  	remove_column :tenants, :expenseyear, :string
  		add_column :tenants, :expenseyear, :integer
  end
end
