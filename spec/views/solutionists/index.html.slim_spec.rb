require 'rails_helper'

RSpec.describe "solutionists/index", :type => :view do
  before(:each) do
    assign(:solutionists, [
      Solutionist.create!(),
      Solutionist.create!()
    ])
  end

  it "renders a list of solutionists" do
    render
  end
end
