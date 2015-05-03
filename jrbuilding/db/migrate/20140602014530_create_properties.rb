class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.belongs_to :building
      t.integer :number
      t.integer :buildingnumber
      t.string :suitedfor
      t.text :notes
      t.boolean :rented

      t.timestamps
    end
  end
end
