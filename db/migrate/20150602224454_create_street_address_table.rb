class CreateStreetAddressTable < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user_infos
      t.string :street_address, null: false
      t.string :street_address2, null: false, default: ''
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
    end
  end
end
