class RemoveMonthlyRentFromProperties < ActiveRecord::Migration
  def change
  	remove_column :tenants, :monthlyrent, :decimal
  end
end
