class Addanotherexpenseyeartotenants < ActiveRecord::Migration
  def change
  	add_column :tenants, :actualexpenseyear, :date
  end
end
