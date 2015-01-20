require 'rails_helper'

RSpec.describe "addresses/new", :type => :view do
  before(:each) do
    assign(:address, Address.new(
      :addressable_type => "MyString",
      :country => "MyString",
      :province => "MyString",
      :city => "MyString",
      :district => "MyString",
      :details => "MyString"
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input#address_addressable_type[name=?]", "address[addressable_type]"

      assert_select "input#address_country[name=?]", "address[country]"

      assert_select "input#address_province[name=?]", "address[province]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_district[name=?]", "address[district]"

      assert_select "input#address_details[name=?]", "address[details]"
    end
  end
end
