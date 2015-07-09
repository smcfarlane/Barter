class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.references :user
      t.string :skill_needed, null: false, array: true, default: []
      t.string :skills_offered, null: false, array: true, default: []
      t.jsonb :details, null: false, defualt: {}
      t.string :status, null: false, default: 'awaiting'
      t.date :needed_by, null: false, default: 1.week.from_now

      t.timestamps null: false
    end
  end
end
