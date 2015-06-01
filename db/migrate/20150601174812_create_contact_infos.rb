class CreateContactInfos < ActiveRecord::Migration
  def change
    create_table :contact_infos do |t|
      t.references :user_infos
      t.string :street_address, null: false
      t.string :street_address2, null: false, default: ''
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :phone, null: false, default: ''
      t.string :email, null: false
      t.string :website, null: false, default: ''

      t.timestamps null: false
    end
  end
end
