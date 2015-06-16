class RecreateAgreementsTable < ActiveRecord::Migration
  def change
    drop_table :agreements
    create_table :agreements do |t|
      t.string :status
      t.string :user1skill
      t.string :user2skill
      t.date :due_date
      t.references :boards
      t.references :user
      t.boolean :user1_agrees, null: false, default: false
      t.boolean :user2_agrees, null: false, default: false

      t.timestamps null: false
    end
  end
end
