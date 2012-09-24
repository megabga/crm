require 'spec_helper'

describe "tests/ajaxes/edit" do
  before(:each) do
    @tests_ajax = assign(:tests_ajax, stub_model(Tests::Ajax,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit tests_ajax form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tests_ajaxes_path(@tests_ajax), :method => "post" do
      assert_select "input#tests_ajax_name", :name => "tests_ajax[name]"
      assert_select "textarea#tests_ajax_description", :name => "tests_ajax[description]"
    end
  end
end
