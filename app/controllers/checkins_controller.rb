class CheckinsController < ApplicationController
	def index
	end

	def new
		@checkin = Checkin.new
	end

	def create
		@checkin = Checkin.new(checkin_params)
		@checkin.save
		redirect_to :back
	end

	private

	def checkin_params
		params.require(:checkin).permit(:beerName, :venue, :address)
	end
end
