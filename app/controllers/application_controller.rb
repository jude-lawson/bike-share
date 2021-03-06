class ApplicationController < ActionController::Base
  helper_method :current_user, :current_admin?
  before_action :set_cart

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end

  private

  def current_user
    @current_user = nil
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def require_admin
    render file: '/public/404' unless current_admin?
  end
end
