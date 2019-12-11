class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_non_authorized

  def admin_types
    ['AdminUser']
  end

  private

  def user_non_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to root_path
  end
end
