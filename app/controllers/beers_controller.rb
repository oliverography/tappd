class BeersController < ApplicationController

  def index
    # index redirects to a random beer

    redirect_to beer_path(brewery_db.beers.random.id)

    # identical redirect, alternate syntax
    # redirect_to :action => "show", :id => brewery_db.beers.random.id
  end

  def show
    @beer = brewery_db.beers.find(params[:id])
  end

end