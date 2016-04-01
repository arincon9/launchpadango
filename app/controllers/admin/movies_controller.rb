module Admin
  class MoviesController < ApplicationController
    def index
      @movies = Movie.all
    end

    def new
      @movie = Movie.new
    end

    def create
      @movie = build_movie

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
      params.require(:movie).permit(:title, :description, :runtime, :image_url, :rating, :trailer_url)
    end

    def build_movie
      if params[:movie][:imdb_id].present?
        build_from_imdb
      else
        build_from_form
      end

    end

    def build_from_form
      Movie.new(movie_params)
    end

    def build_from_imdb
      record = ImdbInterface.find_movie(params[:movie][:imdb_id])

      if record
        Movie.from_imdb(record)
      else
        @movie.errors.add(:imdb_id, "IMDB ID is not valid")
      end
    end
  end
end
