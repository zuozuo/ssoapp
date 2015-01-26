class API::V1::Users < Grape::API
  resource :users do

    desc 'return a user'
    params do
      requires :id, type: Integer, desc: "User id."
    end
    route_param :id do
      get do
        User.find(params[:id])
      end
    end

  end
end
