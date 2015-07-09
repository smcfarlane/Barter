class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers, id: false do |t|
      t.references :user, null: false
      t.references :message_thread, null: false
      t.boolean :active, default: true

      t.timestamps null: false

      t.primary_key [:user_id, :message_thread_id]
    end
  end
end
