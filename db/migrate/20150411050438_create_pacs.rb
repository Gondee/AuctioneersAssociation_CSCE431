class CreatePacs < ActiveRecord::Migration
  def change
    create_table :pacs do |t|
      t.float :PAC_Contribution
      t.references :member, index: true

      t.timestamps null: false
    end
    add_foreign_key :pacs, :members
    add_index :pacs, [:member_id, :created_at]
  end
end
