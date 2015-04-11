class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :Pymt_Type
      t.integer :Pymt_Amt
      t.date :Pymt_Date
      t.references :member, index: true

      t.timestamps null: false
    end
    add_foreign_key :payments, :members
  end
end
