class AuthorizationController < ApplicationController
  def check
    head (current_user ? :no_content : :unauthorized)
  end
end
