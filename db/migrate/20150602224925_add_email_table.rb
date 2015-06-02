class AddEmailTable < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.references :user_info

      t.string :email, null: false
    end
  end
end
