class Changetypeofactualexpenseyear < ActiveRecord::Migration
  def change
  	  	remove_column :tenants, :actualexpenseyear, :date
  		add_column :tenants, :expenseforyear, :integer
  end
end
