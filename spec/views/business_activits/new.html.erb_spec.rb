require 'spec_helper'

describe "business_activits/new" do
  before(:each) do
    assign(:business_activit, stub_model(BusinessActivit,
      :name => "MyString",
      :disable => false
    ).as_new_record)
  end

  it "renders new business_activit form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => business_activits_path, :method => "post" do
      assert_select "input#business_activit_name", :name => "business_activit[name]"
      assert_select "input#business_activit_disable", :name => "business_activit[disable]"
    end
  end
end
