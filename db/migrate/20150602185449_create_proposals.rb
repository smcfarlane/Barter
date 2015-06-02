class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.date :date_range, null: false
      t.references :services, null: false
      t.text :description, null: false, default: ''
      t.references :users
      t.references :service_users

      t.timestamps null: false
    end
  end
end
