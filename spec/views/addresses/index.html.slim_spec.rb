require 'rails_helper'

RSpec.describe "addresses/index", :type => :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :addressable_type => "Addressable Type",
        :country => "Country",
        :province => "Province",
        :city => "City",
        :district => "District",
        :details => "Details"
      ),
      Address.create!(
        :addressable_type => "Addressable Type",
        :country => "Country",
        :province => "Province",
        :city => "City",
        :district => "District",
        :details => "Details"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => "Addressable Type".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Province".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
    assert_select "tr>td", :text => "Details".to_s, :count => 2
  end
end
