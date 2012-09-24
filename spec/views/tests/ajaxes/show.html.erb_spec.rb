require 'spec_helper'

describe "tests/ajaxes/show" do
  before(:each) do
    @tests_ajax = assign(:tests_ajax, stub_model(Tests::Ajax,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
  end
end
