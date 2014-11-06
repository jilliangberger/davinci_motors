class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :model
      t.string :make
      t.integer :year
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
