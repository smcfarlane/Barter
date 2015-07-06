class AddLatAndLngToBoards < ActiveRecord::Migration
  def change
    add_column :boards, :latitude, :float
    add_column :boards, :longitude, :float
  end
end
