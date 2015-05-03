class CreateCheques < ActiveRecord::Migration
  def change
    create_table :cheques do |t|

      t.timestamps
    end
  end
end
