class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    birds = @user.data_base_birds
    @birds = birds.paginate(:page => params[:page], :per_page => 12)
    @map_geo_json = MapPresenter.new(birds).geo_json.paginate(:page => params[:page], :per_page => 12)
  end

  def create
    user = User.find(params[:id])

    bird = DataBaseBird.create(common_name: params[:common_name],
    scientific_name: params[:scientific_name], location: params[:location],
    observation_date: params[:time], lat: params[:lat].to_f, long: params[:lng].to_f)

    ubird = UserBird.create(user_id: user.id, data_base_bird_id: bird.id)

    redirect_to user_path
  end

  def destroy
    UserBird.find_by(data_base_bird_id: params[:bird_id]).destroy
    redirect_to user_path(current_user)
  end
end
