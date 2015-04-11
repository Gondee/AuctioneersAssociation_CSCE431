class CreateContinueedus < ActiveRecord::Migration
  def change
    create_table :continueedus do |t|
      t.float :Annual_Convention_CE_Hours
      t.float :Online_CE_Hours
      t.references :member, index: true

      t.timestamps null: false
    end
    add_foreign_key :continueedus, :members
  end
end
