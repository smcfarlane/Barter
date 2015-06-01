class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name, null: false
      t.text :description, null: false, default: ''
      t.boolean :active, null: false, default: true
      t.references :category, null: false
      t.integer :location
      t.references :user

      t.timestamps null: false
    end
  end
end
