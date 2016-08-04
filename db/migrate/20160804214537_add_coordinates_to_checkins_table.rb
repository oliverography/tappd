class AddCoordinatesToCheckinsTable < ActiveRecord::Migration
  def change
    add_column :checkins, :latitude, :float
    add_column :checkins, :longitude, :float
  end
end
