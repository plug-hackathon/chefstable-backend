class UsersController < ApplicationController
  before_action :set_user, except: %i(index create)

  def index
    @users = policy_scope(User)
    if restaurant_id = params[:restaurant_id].presence
      @users = @users.where restaurant_id: restaurant_id
    end
    render json: @users
  end

  def show
    authorize @user
    render json: @user
  end

  def create
    @user = User.new
    @user.attributes = user_params
    authorize @user
    @user.save!
    render json: @user
  end

  def update
    authorize @user
    @user.attributes = user_params
    authorize @user
    @user.save!
    render json: @user
  end

  def destroy
    authorize @user
    head (@user.destroy ? :ok : :bad_request)
  end

  private def set_user
    @user = User.find(params[:id])
  end

  private def user_params
    params.require(:user).permits(policy(@user).permitted_attributes)
  end
end
