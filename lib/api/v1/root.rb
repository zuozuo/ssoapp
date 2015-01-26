module API
  module V1
    class Root < Grape::API

      helpers do
        def current_user
          @current_user ||= User.authorize!(env)
        end

        def authenticate!
          error!('401 Unauthorized', 401) unless current_user
        end
      end

      version 'v1', using: :path, vendor: 'baozheng'

      mount API::V1::Users
      # mount API::V1::Authors
    end
  end
end
