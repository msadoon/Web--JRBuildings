class RemoveImageFromBuildings < ActiveRecord::Migration
  def change
    remove_column :buildings, :image, :binary
  end
end
