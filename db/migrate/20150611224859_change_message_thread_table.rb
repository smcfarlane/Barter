class ChangeMessageThreadTable < ActiveRecord::Migration
  def change
    drop_table 'message_threads' if ActiveRecord::Base.connection.table_exists? 'message_threads'

    create_table :message_threads do |t|
      t.references :discussable, polymorphic: true
      t.string :title
      t.boolean :active, default: true

      t.timestamps null: false
    end
  end
end
