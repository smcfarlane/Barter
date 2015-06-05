class ChangeReferenceInAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :user_info_id, :integer
    add_column :addresses, :user_id, :integer
  end
end
