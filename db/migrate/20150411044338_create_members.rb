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
      t.string :Main_Phone
      t.string :Main_Email
      t.string :Customer_Type
      t.date :Date_Joined_TAA
      t.string :Pymt_Type
      t.float :Pymt_Amt
      t.date :Pymt_Date
      t.text :Notes
      t.boolean :Added_to_WebBase
      t.float :PAC_Contribution
      t.float :Annual_Convention_CE_Hours
      t.float :Online_CE_Hours

      t.timestamps null: false
    end
  end
end
