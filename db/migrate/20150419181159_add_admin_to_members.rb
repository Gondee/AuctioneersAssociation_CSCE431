class AddAdminToMembers < ActiveRecord::Migration
  def change
    add_column :members, :admin, :boolean, default: false
  end
end
