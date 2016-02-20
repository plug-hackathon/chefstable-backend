class ApplicationController < ActionController::API
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :deny_access

  after_filter :set_access_controll_headers
  #before_filter :check_auth

  def set_access_controll_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end

 # def check_auth
 #   authenticate_or_request_with_http_basic do |login, password|
 #     resource = User.find_by email: login
 #     if resource&.valid_password? password
 #       sign_in :user, resource
 #     end
 #   end
 # end

  alias_method :devise_current_user, :current_user
  def current_user
    if params[:user_id].blank?
      devise_current_user
    else
      User.find(params[:user_id])
    end   
  end

  private def deny_access
    head :unauthorized
  end
end
