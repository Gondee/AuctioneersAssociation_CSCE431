class RemovePasswordDigestToMembers < ActiveRecord::Migration
  def change
    remove_column :members, :password_digest, :string
  end
end
