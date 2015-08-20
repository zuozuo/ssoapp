class Api::V1::BaseController < ApplicationController

private

  def user_source
    if doorkeeper_token && doorkeeper_token.application.name.match("iOS")
      1
    else
      0
    end
  end

  def current_user
    @current_user ||= User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end
end
