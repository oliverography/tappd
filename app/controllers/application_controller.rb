class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def brewery_db
    @brewery_db = BreweryDB::Client.new do |config|
      config.api_key = ENV["BREWERYDB_API_KEY2"]
    end
  end

  # def current_user
  #   if session[:user_id]
  #     @current_user = User.find(session[:user_id])
  #   end
  # end
  # helper_method :current_user
end