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

    # MATCHING PSEUDO CODE 
    # find checkins where beername is @beerLocal.name

    # if nil
    #   redirect to beers_path
    # else
    #   sort by distance from user

    #   if closest distance < travelradius
    #     jquery modal with checkin.address passed into google map link

    #     modal close is redirect to beers_path
    #   else
    #     redirect to beers_path
    #   end
    # end

    redirect_to beers_path
  end

  private

  def beer_params
    params.require(:beer).permit(:name, :brewery, :label, :style, :abv, :ibu, :available, :description, :user_id)
  end

end