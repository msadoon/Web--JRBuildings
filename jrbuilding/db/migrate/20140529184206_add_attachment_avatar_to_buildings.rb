class AddAttachmentAvatarToBuildings < ActiveRecord::Migration
  def self.up
    change_table :buildings do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :buildings, :avatar
  end
end
