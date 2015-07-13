class AddColumnToSkillsUsers < ActiveRecord::Migration
  def change
    add_column :skills_users, :details, :text
  end
end
