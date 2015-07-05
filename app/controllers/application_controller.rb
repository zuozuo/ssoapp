class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  respond_to :json, :html, :js

  # protect_from_forgery with: :exception
  # protect_from_forgery unless: -> { request.format.json? }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  before_action :authenticate_user!

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      'devise'
    else
      "application"
    end
  end
end
