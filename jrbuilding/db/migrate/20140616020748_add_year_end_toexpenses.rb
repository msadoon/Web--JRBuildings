class AddYearEndToexpenses < ActiveRecord::Migration
  def change
  	add_column :expenses, :yearend, :date
  end
end
