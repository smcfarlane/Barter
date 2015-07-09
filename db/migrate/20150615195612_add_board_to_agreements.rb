class AddBoardToAgreements < ActiveRecord::Migration
  def change
    add_reference :agreements, :boards, null: false
  end
end
