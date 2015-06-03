class AddPhonesTable < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.references :user_info

      t.string :phone, null: false, default: ''
    end
  end
end
