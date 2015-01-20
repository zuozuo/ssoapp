require 'rails_helper'

RSpec.describe "Solutionists", :type => :request do
  describe "GET /solutionists" do
    it "works! (now write some real specs)" do
      get solutionists_path
      expect(response.status).to be(200)
    end
  end
end
