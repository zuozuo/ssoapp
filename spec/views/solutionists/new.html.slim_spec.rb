require 'rails_helper'

RSpec.describe "solutionists/new", :type => :view do
  before(:each) do
    assign(:solutionist, Solutionist.new())
  end

  it "renders new solutionist form" do
    render

    assert_select "form[action=?][method=?]", solutionists_path, "post" do
    end
  end
end
