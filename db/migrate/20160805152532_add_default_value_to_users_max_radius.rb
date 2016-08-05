class AddDefaultValueToUsersMaxRadius < ActiveRecord::Migration
  def change
    change_column :users, :maxRadius, :integer, :default => 5
  end
end
