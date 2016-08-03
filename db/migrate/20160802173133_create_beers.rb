class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :index
      t.string :show

      t.timestamps null: false
    end
  end
end
