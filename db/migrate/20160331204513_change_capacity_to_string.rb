class ChangeCapacityToString < ActiveRecord::Migration
  def change
    change_column :theatres, :capacity, :string
  end
end
