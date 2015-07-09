class RenameColumnInSkillUsersTable < ActiveRecord::Migration
  def change
    rename_column :skills_users, :user_id_id, :user_id
    rename_column :skills_users, :skill_id_id, :skill_id
  end
end
