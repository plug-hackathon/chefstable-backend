class ApplicationController < ActionController::API
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :deny_access


  private def deny_access
    head :unauthorized
  end
end
