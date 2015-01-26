class UsersController < ApplicationController
  load_and_authorize_resource

  def edit
  end

  def show
    respond_with @user
  end
end
