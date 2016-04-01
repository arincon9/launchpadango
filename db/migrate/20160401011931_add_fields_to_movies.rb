class AddFieldsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :image_url, :string
    add_column :movies, :rating, :integer
    add_column :movies, :trailer_url, :string
  end
end
