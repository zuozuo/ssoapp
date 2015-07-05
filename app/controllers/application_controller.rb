class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  respond_to :json, :html, :js

  # protect_from_forgery with: :exception
  # protect_from_forgery unless: -> { request.format.json? }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  before_action :authenticate_user!
  before_action :reject_forbidden_user

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      "application"
    end
  end

  def reject_forbidden_user
    if current_user.try(:forbidden)
      sign_out(current_user)
      redirect_to sign_in_path, notice: "您的账户已被禁止登陆。"
    end
  end
end
