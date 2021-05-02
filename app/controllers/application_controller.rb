class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception

  before_action :authenticate_user!

  add_flash_types :success, :danger, :warning

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = t('controllers.application.user_not_authorized')
    redirect_to(request.referrer || root_path)
  end
end
