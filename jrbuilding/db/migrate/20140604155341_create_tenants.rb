class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.integer :buildingnumber
      t.integer :propertynumber
      t.string :businessname
      t.string :tenantname
      t.boolean :status
      t.boolean :type
      t.text :notes
      t.integer :postgiven
      t.integer :posttogive
      t.boolean :renewal
      t.string :email
      t.decimal :monthrent
      t.string :businesstype
      t.text :addterms
      t.text :renewterms
      t.decimal :gst
      t.decimal :qst
      t.decimal :monthrentwithtax
      t.decimal :yearrentwithtax
      t.date :leasestart
      t.date :leaseend
      t.decimal :pshare
      t.integer :expenseyear
      t.decimal :yearlyincrease
      t.decimal :additionalrent
      t.decimal :monthlyrent

      t.timestamps
    end
  end
end
