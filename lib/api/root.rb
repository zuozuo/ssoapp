module API
  class Root < Grape::API
    format :json
    prefix :api

    mount API::V1::Root
  end
end
