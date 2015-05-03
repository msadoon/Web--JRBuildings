class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name
      t.integer :number
      t.text :address
      t.string :city
      t.string :province
      t.string :country
      t.binary :image

      t.timestamps
    end
  end
end
