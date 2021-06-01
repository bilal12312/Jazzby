class ApplicationController < ActionController::Base
	include Pundit
	protect_from_forgery with: :exception
	
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :current_cart



	before_action :update_allowed_parameters, if: :devise_controller?
	before_action :authenticate_user!

	protected

	def update_allowed_parameters
	   devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :email, :password)}
	   devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :surname, :email, :password, :current_password)}
	end

	def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
  	end

  private

  	def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
    end

    def current_cart
    if session[:cart_id]
      cart = Cart.find_by(:id => session[:cart_id])
      if cart.present?
        @current_cart = cart
      else
        session[:cart_id] = nil
      end
    end

    if session[:cart_id] == nil
      @current_cart = Cart.create
      session[:cart_id] = @current_cart.id
    end

  end
end
