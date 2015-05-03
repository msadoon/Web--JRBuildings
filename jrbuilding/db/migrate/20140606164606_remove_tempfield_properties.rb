class RemoveTempfieldProperties < ActiveRecord::Migration
  def change
  	remove_column :buildings, :buildingsinfotemp, :string
  	add_column :properties, :buildingsinfotemp, :string
  end
end
