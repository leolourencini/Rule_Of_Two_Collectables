class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_brands
  before_action :search_collections
  before_action :get_provinces
  before_action :update_allowed_parameters, if: :devise_controller?

  def set_brands
    @navbar_categories = Brand.all
  end
  def search_collections
    @search_categories = Collection.all
  end
  def get_provinces
    @user_provinces = Province.all
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :address, :province_id, :email, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :address, :province_id, :email, :password, :current_password)}
  end
end
