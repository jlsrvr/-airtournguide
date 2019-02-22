class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tours = @user.tours
    authorize @user
    authorize @tours
  end
end
