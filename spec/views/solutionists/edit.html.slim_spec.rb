require 'rails_helper'

RSpec.describe "solutionists/edit", :type => :view do
  before(:each) do
    @solutionist = assign(:solutionist, Solutionist.create!())
  end

  it "renders the edit solutionist form" do
    render

    assert_select "form[action=?][method=?]", solutionist_path(@solutionist), "post" do
    end
  end
end
