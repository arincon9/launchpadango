class CreateTheatres < ActiveRecord::Migration
  def change
    create_table :theatres do |t|
      t.integer :capacity
      t.integer :number

      t.timestamps null: false
    end
  end
end
