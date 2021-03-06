class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  #PUNDIT

  before_action :authenticate_user!
  include Pundit

  after_action :verify_authorized, except: :index, unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index, unless: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(dashboard_path)
  end

  #END OF PUNDIT SETTINGS

  protect_from_forgery with: :exception

  # Configuration meta tags
  def default_url_options
    { host: ENV['HOST'] || 'localhost:3000' }
  end

end
