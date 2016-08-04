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
    # save beer to beer list
    # @beerLocal = Beer.create(beer_params)

    # Store lat_lng cookie value in variable
    @lat_lng = cookies[:lat_lng].split("|")

    # get all checkins that with matching beer name
    @checkinsWithBeer = Checkin.where(beerName: "Anniversary")
    # narrow checkins down to those within user's maxRadius
    @checkinsWithBeerAndNear = @checkinsWithBeer.near([@lat_lng[0], @lat_lng[1]], current_user.maxRadius)

    # first entry is the closest
    @nearstCheckinWithBeer = @checkinsWithBeerAndNear[0]

    if Checkin.where(beerName: "Anniversary").exists?
      respond_to do |format|
        
        # run create.js.erb to create modal
        format.js
      end
    else
      redirect_to beers_path
    end

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