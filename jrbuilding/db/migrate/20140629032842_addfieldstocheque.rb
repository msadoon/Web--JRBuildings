class Addfieldstocheque < ActiveRecord::Migration
  def change
  	add_column :cheques, :postdate, :date
  	add_column :cheques, :amount, :decimal
  	add_column :cheques, :tenant_id, :integer
  end
end
