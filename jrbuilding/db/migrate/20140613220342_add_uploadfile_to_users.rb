class AddUploadfileToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.has_attached_file :mlease
    end
  end

  def self.down
    drop_attached_file :users, :mlease
  end
end
