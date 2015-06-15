class DropSkillsUsersTable < ActiveRecord::Migration
  def change
    drop_table :skills_users
    create_table :skills_users do |t|
      t.references :user_id, null: false
      t.references :skill_id, null: false
    end
  end
end
