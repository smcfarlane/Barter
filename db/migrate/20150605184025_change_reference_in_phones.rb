class ChangeReferenceInPhones < ActiveRecord::Migration
  def change
    remove_column :phones, :user_info_id, :integer
    add_column :phones, :user_id, :integer
  end
end
