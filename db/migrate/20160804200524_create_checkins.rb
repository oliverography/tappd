class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :beerName
      t.string :venue
      t.string :address
      t.string :city

      t.timestamps null: false
    end
  end
end
