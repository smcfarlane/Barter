class AddNameToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :name, :string
    add_reference :users, :groups, index: true
  end
end
