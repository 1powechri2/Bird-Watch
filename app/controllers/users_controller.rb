class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @birds = @user.data_base_birds.paginate(:page => params[:page], :per_page => 12)
  end

  def create
    user = User.find(params[:id])

    bird = DataBaseBird.create(comName: params[:common_name],
    sciName: params[:scientific_name], locName: params[:location],
    obsDt: params[:time], lat: params[:lat], lng: params[:lng])

    ubird = UserBird.create(user_id: user.id, data_base_bird_id: bird.id)

    redirect_to user_path
  end
end
