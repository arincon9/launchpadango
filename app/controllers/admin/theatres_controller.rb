module Admin
  class TheatresController < ApplicationController
    def index
      @theatres = Theatre.all
    end

    def new
      @theatre = Theatre.new
    end

    def create
      @theatre = Theatre.new(theatre_params)

      respond_to do |format|
        if @theatre.save
          format.html { redirect_to admin_theatres_path, notice: 'Theatre was created successfully' }
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
        if @theatre.save
          format.html { redirect_to admin_theatres_path, notice: 'Theatre was updated successfully' }
          format.js
        else
          format.html { render 'edit' }
          format.js
        end
      end
    end

    def destroy
      @theatre.destroy

      flash[:notice] = "Theatre has been deleted"
      redirect_to admin_theatres_path
    end

    protected

    def theatre_params
      params.require(:theatre).permit(:capacity, :number)
    end
  end
end
