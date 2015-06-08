class RemoveUnwantedTables < ActiveRecord::Migration
  def change
    drop_table :pages
    drop_table :subjects
    drop_table :sections
    drop_table :contact_infos
  end
end
