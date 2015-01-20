require "rails_helper"

RSpec.describe SolutionistsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/solutionists").to route_to("solutionists#index")
    end

    it "routes to #new" do
      expect(:get => "/solutionists/new").to route_to("solutionists#new")
    end

    it "routes to #show" do
      expect(:get => "/solutionists/1").to route_to("solutionists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/solutionists/1/edit").to route_to("solutionists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/solutionists").to route_to("solutionists#create")
    end

    it "routes to #update" do
      expect(:put => "/solutionists/1").to route_to("solutionists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/solutionists/1").to route_to("solutionists#destroy", :id => "1")
    end

  end
end
