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
        
       # In case I want to add a search option: 
       # if params[:q]       -------> if the user submitted a search
       # @destinations = @destinations.search(params[:q])  -->search through what we have
       # end
      end

    def show 
      @destination = Destination.find(params[:id])
    end
    
    def destroy
      @destination = Destination.find_by(id: params[:id])
      if !@destination
        redirect_to destinations_path
      end
      @destination.destroy
      redirect_to destinations_path
    end

    private

    def destination_params

        params.require(:destination).permit(:name,:continent)

    end


end
