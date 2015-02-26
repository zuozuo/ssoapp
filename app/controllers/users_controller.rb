class UsersController < ApplicationController
  load_and_authorize_resource

  before_action :redirect_back

  def index
    @users = User.order('created_at desc').paginate(:page => params[:page], :per_page => 30)
  end

  def edit
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
    current_user.try(:admin?) or redirect_to main_index_path
  end

end
