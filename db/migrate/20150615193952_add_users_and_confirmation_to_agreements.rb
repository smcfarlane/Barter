class AddUsersAndConfirmationToAgreements < ActiveRecord::Migration
  def change
    add_column :agreements, :user1, :integer, null: false
    add_column :agreements, :user2, :integer, null: false
    add_column :agreements, :user1_confirm, :boolean, null: false, default: false
    add_column :agreements, :user2_confirm, :boolean, null: false, default: false
  end
end
