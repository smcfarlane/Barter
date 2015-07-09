class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, null: false
      t.references :message_thread, null: false
      t.text :text, null: false
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
