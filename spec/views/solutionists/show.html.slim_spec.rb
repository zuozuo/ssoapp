require 'rails_helper'

RSpec.describe "solutionists/show", :type => :view do
  before(:each) do
    @solutionist = assign(:solutionist, Solutionist.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
