class BeersController < ApplicationController

  def index
    # index redirects to a random beer
    redirect_to beer_path(brewery_db.beers.random.id)
    
    # identical redirect, alternate syntax
    # redirect_to :action => "show", :id => brewery_db.beers.random.id
  end

  def show
    @beer = brewery_db.beers.find(params[:id])

    @beerLocal = Beer.new

  end

  def create
    @beerLocal = Beer.create(beer_params)

    @lat_lng = cookies[:lat_lng].split("|")

    # MATCHING PSEUDO CODE 

    # find checkins where beername is @beer.name
    

    # if @checkinsWithBeer = Checkins.where(beername: @beer.name)
      
    # else
    #   redirect_to beers_path
    # end
    redirect_to beers_path
  end

  def destroy
    Beer.find(params[:id]).destroy

    redirect_to :back
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :brewery, :label, :style, :abv, :ibu, :available, :description, :user_id)
  end

end