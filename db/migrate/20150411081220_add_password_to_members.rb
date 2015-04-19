class AddPasswordToMembers < ActiveRecord::Migration
  def change
    add_column :members, :password, :string
  end
end
