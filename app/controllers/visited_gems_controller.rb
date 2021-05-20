class VisitedGemsController < ApplicationController
  def new
    #we want to be able to make a new visited_gem for an *existing* destination.
    #checking if it's nested and has an id that we already have:
    if params[:destination_id] && destination = Destination.find_by_id(params[:destination_id])
      #nested route - is an instance of a visitedgem that has already a destination
      @visited_gem = destination.visited_gems.build #has_many
    else
      #not nested - we make new instance of a destination
    @visited_gem = VisitedGem.new
    @visited_gem.build_destination #belongs_to
    end
  end
  

  def create
    @visited_gem = current_user.visited_gems.build(visited_gem_params)
    if @visited_gem.save
      redirect_to visited_gem_path(@visited_gem)
    else
      render :new
    end
  end


  def index
#for being able to do http://localhost:3000/destinations/10/visited_gems -- meaning 
#if i want to see all visited_gems of a certain destination
    #checking if it's nested and has an id that we already have:
    if params[:destination_id] && destination = Destination.find_by_id(params[:destination_id])
      #nested route
      @visited_gems = destination.visited_gems
    else
    @visited_gems = VisitedGem.all
    end
  end

      def show 
        @visited_gem = VisitedGem.find_by(id: params[:id])
    if !@visited_gem
      redirect_to visited_gems_path
    end
      end
    
      

    private
    def visited_gem_params

        params.require(:visited_gem).permit(:name, :description, :destination_id)
# we added a new thing to our form - destination_id - thus we must allow it 
#as a param here too 
    end
end
