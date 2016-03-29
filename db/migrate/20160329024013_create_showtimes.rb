class CreateShowtimes < ActiveRecord::Migration
  def change
    create_table :showtimes do |t|
      t.datetime :time
      t.belongs_to :movie, index: true
      t.belongs_to :theatre, index: true

      t.timestamps null: false
    end
  end
end
