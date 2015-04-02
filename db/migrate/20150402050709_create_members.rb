class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :Last_Name
      t.string :First_Name
      t.string :Company
      t.integer :TX_License
      t.text :Street1
      t.string :City
      t.string :State
      t.integer :Zip
      t.integer :Main_Phone
      t.string :Main_Email
      t.string :Customer_Type
      t.integer :Date_Joined_TAA
      t.string :Pymt_Type
      t.integer :Pymt_Amt
      t.date :Pymt_Date
      t.text :Notes
      t.boolean :Added_to_WebBase
      t.integer :PAC_Contribution
      t.integer :Annual_Convention_CE_Hours
      t.integer :Online_CE_Hours

      t.timestamps null: false
    end
  end
end
