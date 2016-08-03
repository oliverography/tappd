class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
<<<<<<< HEAD
end

def index
=======

  def brewery_db
    @brewery_db = BreweryDB::Client.new do |config|
      config.api_key = '2ea522f7b4a2ee81239cb466e0187ac7'
    end
  end
>>>>>>> 23c4dd9f430479114c765529082aeb5f995fbe7d
end