class Changeexpensesforyearintenants < ActiveRecord::Migration
  def change
  	  	remove_column :tenants, :expenseforyear, :integer
  		add_column :tenants, :expenseforyear, :decimal
  end
end
