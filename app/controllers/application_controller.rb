class ApplicationController < ActionController::Base
  before_action :change_locale
  helper_method :current_user

private

  def current_user
    @current_user ||= User.find_by_uid(session[:user_id]) if session[:user_id]
  end

  def change_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end
end
