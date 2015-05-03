class RemoveCityAndProvinceCountryFromBuildings < ActiveRecord::Migration
  def change
    remove_column :buildings, :city, :string
    remove_column :buildings, :province, :string
    remove_column :buildings, :country, :string
  end
end
