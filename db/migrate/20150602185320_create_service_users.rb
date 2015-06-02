class CreateServiceUsers < ActiveRecord::Migration
  def change
    create_table :service_users do |t|
      t.references :users, null: false
      t.references :servcies, null: false
      t.string :location, null: false

      t.timestamps null: false
    end
  end
end
