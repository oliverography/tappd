class AddAttributeColumnsToBeersTable < ActiveRecord::Migration
  def change
    add_column :beers, :name, :string
    add_column :beers, :brewery, :string
    add_column :beers, :label, :string
    add_column :beers, :style, :string
    add_column :beers, :abv, :float
    add_column :beers, :ibu, :integer
    add_column :beers, :available, :string
    add_column :beers, :description, :text
  end
end
