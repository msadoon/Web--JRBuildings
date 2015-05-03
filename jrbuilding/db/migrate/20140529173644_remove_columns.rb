class RemoveColumns < ActiveRecord::Migration
  def change
  end

  def self.up
  	remove_column :buildings, :image, :binary
  end

  def self.down
  	add_column :buildings, :image
  end
end
