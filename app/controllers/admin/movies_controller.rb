module Admin
  class MoviesController < ApplicationController
    def index
      @movies = Movie.all
    end

    def destroy
      @movie = Movie.find(params[:id])

      if @movie.destroy
        redirect_to admin_movies_path, notice: 'Movie removed'
      else
        redirect_to admin_movies_path, error: 'Unable to remove movie'
      end
    end
  end
end