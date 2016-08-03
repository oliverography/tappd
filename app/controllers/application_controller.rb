class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def brewery_db
    @brewery_db = BreweryDB::Client.new do |config|
      config.api_key = '2ea522f7b4a2ee81239cb466e0187ac7'
    end
  end
end