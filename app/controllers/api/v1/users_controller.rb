class Api::V1::UsersController < Api::V1::BaseController

  skip_before_action :authenticate_user!
  before_action :doorkeeper_authorize!
  
  respond_to :json

  def show
    respond_with current_user
  end

  def me
    respond_with current_user
  end

  def index
    respond_with @users = User.all
  end

  def create
    @user = User.create!(params[:user])
    respond_with @user, location: nil
  end
end
