class ChangeColumnNameInAgreemenst < ActiveRecord::Migration
  def change
    rename_column :agreements, :boards_id, :board_id
  end
end
