require 'rails_helper'

RSpec.describe "stores/edit", :type => :view do
  before(:each) do
    @store = assign(:store, Store.create!())
  end

  it "renders the edit store form" do
    render

    assert_select "form[action=?][method=?]", store_path(@store), "post" do
    end
  end
end
