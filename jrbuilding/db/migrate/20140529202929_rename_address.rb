class RenameAddress < ActiveRecord::Migration
  def change
  	rename_column :buildings, :address, :postalcode
  end
end
