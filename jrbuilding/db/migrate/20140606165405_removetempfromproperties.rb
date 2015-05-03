class Removetempfromproperties < ActiveRecord::Migration
  def change
  	remove_column :properties, :buildingsinfotemp, :string
  end
  
end
