class RecreateAgreementsTable < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.string :status
      t.string :user1skill
      t.string :user2skill
      t.date :due_date
      t.references :boards

      t.timestamps null: false
    end

    create_table :agreements_users do |t|
      t.references :agreements, null: false
      t.references :users, null: false
      t.boolean :user_agrees, null: false, default: false
      t.boolean :creator, null: false
    end
  end
end
