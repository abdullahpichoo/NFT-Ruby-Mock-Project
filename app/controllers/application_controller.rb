class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :init_cart

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def after_sign_in_path_for(_resource)
    @new_wallet = current_user.create_wallet(balance: 0, earnings: 0, items_sold: 0) unless !current_user.wallet.nil?
    all_path
  end

  def init_cart
    return unless user_signed_in?

    @cart ||= Cart.find_by(user_id: current_user.id)

    return unless @cart.nil?

    @cart = Cart.create(user_id: current_user.id)
  end

  # For Rendering Devise Views Anywhere
  def resource_name
    :user
  end
  helper_method :resource_name

  def resource
    @resource ||= User.new
  end
  helper_method :resource

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  helper_method :devise_mapping

  def resource_class
    User
  end
  helper_method :resource_class
end
