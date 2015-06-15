class AddActivationToMembers < ActiveRecord::Migration
  def change
    add_column :members, :activation_digest, :string
    add_column :members, :activated, :boolean, default: true
    add_column :members, :activated_at, :datetime
  end
end
