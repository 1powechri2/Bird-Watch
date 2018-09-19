class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @birds = @user.data_base_birds.paginate(:page => params[:page], :per_page => 12)
  end

  def create
    user = User.find(params[:id])

    bird = DataBaseBird.create(common_name: params[:common_name],
    scientific_name: params[:scientific_name], location: params[:location],
    observation_date: params[:time], lat: params[:lat], long: params[:lng])

    ubird = UserBird.create(user_id: user.id, data_base_bird_id: bird.id)

    redirect_to user_path
  end
end
