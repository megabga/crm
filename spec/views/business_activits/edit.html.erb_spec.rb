require 'spec_helper'

describe "business_activits/edit" do
  before(:each) do
    @business_activit = assign(:business_activit, stub_model(BusinessActivit,
      :name => "MyString",
      :disable => false
    ))
  end

  it "renders the edit business_activit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => business_activits_path(@business_activit), :method => "post" do
      assert_select "input#business_activit_name", :name => "business_activit[name]"
      assert_select "input#business_activit_disable", :name => "business_activit[disable]"
    end
  end
end
