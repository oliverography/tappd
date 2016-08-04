class AddMaxRadiusToUserTable < ActiveRecord::Migration
  def change
    add_column :users, :maxRadius, :integer
  end
end