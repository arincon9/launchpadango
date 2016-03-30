class ShowtimesController < ApplicationController
  def index
    if params[:movie_id].present?
      @showtimes = Showtime.where(movie_id: params[:movie_id])
    else
      @showtimes = Showtime.all
    end
  end

  def new
    @showtime = Showtime.new
  end

  def create
    @showtime = Showtime.new(showtime_params)

    respond_to do |format|
      if @showtime.save
        format.html { redirect_to showtimes_path, notice: 'Showtime was added.' }
        format.js
      else
        format.html { render 'new' }
        format.js
      end
    end
  end

  def update
    respond_to do |format|
      if @showtime.save
        format.html { redirect_to showtimes_path, notice: 'Showtime was updated successfully.' }
        format.js
      else
        format.html { render 'edit' }
        format.js
      end
    end
  end

  def destroy
    @showtime.destroy

    flash[:notice] = "Showtime has been deleted."
    redirect_to showtime_path
  end

  protected

  def showtime_params
    params.require(:showtime).permit(:time, :theatre_id, :movie_id)
  end
end
