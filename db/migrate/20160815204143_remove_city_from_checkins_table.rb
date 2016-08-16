class RemoveCityFromCheckinsTable < ActiveRecord::Migration
  def change
    remove_column :checkins, :city
  end
end
