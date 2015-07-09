class CreateMessageThreads < ActiveRecord::Migration
  def change
    create_table :message_threads do |t|
      t.integer :discussable_id, null: false
      t.string :discussable_type, null: false
      t.string :title
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
