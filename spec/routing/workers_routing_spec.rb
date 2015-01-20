require "rails_helper"

RSpec.describe WorkersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/workers").to route_to("workers#index")
    end

    it "routes to #new" do
      expect(:get => "/workers/new").to route_to("workers#new")
    end

    it "routes to #show" do
      expect(:get => "/workers/1").to route_to("workers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/workers/1/edit").to route_to("workers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/workers").to route_to("workers#create")
    end

    it "routes to #update" do
      expect(:put => "/workers/1").to route_to("workers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/workers/1").to route_to("workers#destroy", :id => "1")
    end

  end
end
