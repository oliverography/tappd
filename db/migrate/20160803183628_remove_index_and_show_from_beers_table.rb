class RemoveIndexAndShowFromBeersTable < ActiveRecord::Migration
  def change
    remove_column :beers, :index
    remove_column :beers, :show
  end
end
