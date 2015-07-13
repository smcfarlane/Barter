class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.string :status, null: false
      t.text :details, null: false, default: ''
      t.references :user1skill, references: :skills_users
      t.references :user2skill, references: :skills_users
      t.date :due_date

      t.timestamps null: false
    end
  end
end
