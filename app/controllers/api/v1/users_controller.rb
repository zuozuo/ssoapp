class Api::V1::UsersController < Api::V1::BaseController

  skip_before_action :authenticate_user!
  before_action :doorkeeper_authorize!
  before_action :reject_forbidden_user
  
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

  # PUT    /users/:id(.:format)                         users#update
  def update
    @user = User.find(params[:id])
    @user.update_attributes!(user_params)
    render :json => @user
  end

  def create
    response.headers['X-CSRF-Token'] = form_authenticity_token
    if User.where(phone: user_params[:phone]).exists?
      render :json => "user with phone #{user_params[:phone]} already exists"
    else
      @user = User.create!(user_params.merge(email: "#{user_params[:phone]}@jinguwen.com"))
      respond_with @user, location: nil
    end
  end

  private

    def reject_forbidden_user
      if current_user.try(:forbidden)
        render :json => "user account forbidden", status: 401
      end
    end 

    def user_params
      params.require(:user).permit(:name, :phone, :email, :password, :password_confirmation)
    end
end
