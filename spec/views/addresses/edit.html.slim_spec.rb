require 'rails_helper'

RSpec.describe "addresses/edit", :type => :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :addressable_type => "MyString",
      :country => "MyString",
      :province => "MyString",
      :city => "MyString",
      :district => "MyString",
      :details => "MyString"
    ))
  end

  it "renders the edit address form" do
    render

    assert_select "form[action=?][method=?]", address_path(@address), "post" do

      assert_select "input#address_addressable_type[name=?]", "address[addressable_type]"

      assert_select "input#address_country[name=?]", "address[country]"

      assert_select "input#address_province[name=?]", "address[province]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_district[name=?]", "address[district]"

      assert_select "input#address_details[name=?]", "address[details]"
    end
  end
end
