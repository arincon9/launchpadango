module Admin
  class MoviesController < ApplicationController
    def index
      @movies = Movie.all
    end

    def new
      @movie = Movie.new
    end

    def create
      @movie = Movie.new(movie_params)

      respond_to do |format|
        if @movie.save
          format.html { redirect_to movies_path, notice: 'Movie was created successfully' }
          format.js
        else
          format.html { render 'new' }
          format.js
        end
      end
    end

    def destroy
      @movie = Movie.find(params[:id])

      if @movie.destroy
        redirect_to admin_movies_path, notice: 'Movie removed'
      else
        redirect_to admin_movies_path, error: 'Unable to remove movie'
      end
    end

    protected

    def movie_params
      params.require(:movie).permit(:title, :description, :runtime)
    end
  end
end