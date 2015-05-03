class AddExpaddToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.has_attached_file :expadd
    end
  end

  def self.down
    drop_attached_file :users, :expadd
  end
end
