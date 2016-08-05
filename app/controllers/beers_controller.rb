class BeersController < ApplicationController

  def index
    # index redirects to a random beer
    @beerRandom = brewery_db.beers.random(hasLabels: 'Y')
    redirect_to beer_path(@beerRandom.id)

    # identical redirect, alternate syntax
    # redirect_to :action => "show", :id => brewery_db.beers.random.id
  end

  def show
    @beer = brewery_db.beers.find(params[:id], withBreweries: 'Y')

    @beerLocal = Beer.new
  end

  def create
    # Store lat_lng cookie value in variable
    @lat_lng = cookies[:lat_lng].split("|")
    # save beer to user's beer list
    @beerLocal = Beer.create(beer_params)

    # MATCHING
    # get all checkins that with matching beer name
    @checkinsWithBeer = Checkin.where(beerName: @beerLocal.name)
    # narrow checkins down to those within user's maxRadius
    @checkinsWithBeerAndNear = @checkinsWithBeer.near([@lat_lng[0], @lat_lng[1]], current_user.maxRadius)
    # first entry is the closest
    @nearstCheckinWithBeer = @checkinsWithBeerAndNear[0]

    if @checkinsWithBeerAndNear.blank?
      redirect_to beers_path
    else
      respond_to do |format|
        
        # run create.js.erb to create modal
        format.js
      end
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