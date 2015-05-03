class AddTempbuildinginfofield < ActiveRecord::Migration
  def change
  	add_column :buildings, :buildingsinfotemp, :string
  end
end
