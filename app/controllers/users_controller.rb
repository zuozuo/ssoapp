class UsersController < ApplicationController
  load_and_authorize_resource

  before_action :redirect_back, except: [:edit_password, :update_password]
  skip_before_action :authenticate_user!, only: [:edit_password, :update_password]

  def index
    @users = User.order('created_at desc').paginate(:page => params[:page], :per_page => 30)
  end

  def edit
  end

  def forbidden
    @user = User.find(params[:user_id])
    @user.update_attributes!(forbidden: params[:forbidden])
    redirect_to :back, notice: "更新成功!"
  end

  def update_password
    @user = User.find(params[:user_id])
    @user.update_attributes(user_params)
    if @user.valid?
      sign_in @user
      redirect_to :back, notice: "密码更新成功"
    else
      redirect_to :back, notice: @user.errors.messages.values.flatten.join
    end
  end

  def edit_password
    pm = PhoneNumber.where(phone: params[:phone], verify_code: params[:code]).last
    if pm.validate!
      @user = User.where(phone: params[:phone]).first
    else
      redirect :back, alert("验证码错误")
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes!(user_params)
    redirect_to :back, notice: "用户信息更新成功"
  end

  def search
    @users = User.order('created_at desc').where(
      "name like ? or email like ?", "%#{params[:q]}%", "%#{params[:q]}%"
    ).paginate(:page => params[:page], :per_page => 30)
  end

  def show
    respond_with @user
  end

  private

  def redirect_back
    (current_user.try(:admin?) || can?(:manage, @user)) or redirect_to main_index_path
  end

  def user_params
    params.require(:user).permit(:phone, :password, :password_confirmation, :name, :avatar, :forbidden)
  end

end
