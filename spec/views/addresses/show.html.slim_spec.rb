require 'rails_helper'

RSpec.describe "addresses/show", :type => :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :addressable_type => "Addressable Type",
      :country => "Country",
      :province => "Province",
      :city => "City",
      :district => "District",
      :details => "Details"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Addressable Type/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Province/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/District/)
    expect(rendered).to match(/Details/)
  end
end
