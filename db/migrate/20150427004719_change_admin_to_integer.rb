class ChangeAdminToInteger < ActiveRecord::Migration
  def change
    change_column :members, :admin, :integer
  end
end
