class AddAdminToMembers < ActiveRecord::Migration
  def change
    add_column :members, :admin, :integer, default: false
  end
end
