class ApplicationController < ActionController::API
  include Pundit

  rescue_from ActiveRecord::RecordInvalid, with: :render_errors
  rescue_from Pundit::NotAuthorizedError,  with: :deny_access

  def render_errors(exception)
    render json: {errors: exception.record.errors}, status: :bad_record
  end

  private def deny_access
    head :unauthorized
  end
end
