class DestinationsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def new
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @destination = @user.destinations.build
      else
        @destination = Destination.new
      end
     
    end

    def create
        @destination = current_user.destinations.build(destination_params)
        if @destination.save
          redirect_to destination_path(@destination)
        else
          render :new
        end
      end

      def index
       @destinations = Destination.all
        
      end

    def show 
      @destination = Destination.find(params[:id])
    end
    

    private

    def destination_params

        params.require(:destination).permit(:name,:continent)

    end


end
