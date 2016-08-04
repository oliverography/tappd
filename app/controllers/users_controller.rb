class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    
    # if @user != current_user
    #   redirect_to :back, :alert => "Access denied."
    # end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
