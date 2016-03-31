class ChangeTheatreNumberToString < ActiveRecord::Migration
  def change
    change_column :theatres, :number, :string
  end
end
