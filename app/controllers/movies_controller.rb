class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to movies_path, notice: 'Movie was created successfully.' }
        format.js
      else
        format.html { render 'new' }
        format.js
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @movie.save
        format.html { redirect_to movies_path, notice: 'Movie was updated successfully' }
        format.js
      else
        format.html { render 'edit' }
        format.js
      end
    end
  end

  protected

  def movie_params
    params.require(:movie).permit(:title, :description, :runtime)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The movie you were looking for could not be found."
    redirect_to movies_path
  end
end
