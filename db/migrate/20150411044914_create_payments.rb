class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :Pymt_Type
      t.float :Pymt_Amt
      t.date :Pymt_Date
      t.integer :references, index: true

      t.timestamps null: false
    end
    add_foreign_key :payments, :members
    add_index :payments, [:member_id, :created_at]
  end
end
