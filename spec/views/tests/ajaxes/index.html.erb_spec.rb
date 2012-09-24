require 'spec_helper'

describe "tests/ajaxes/index" do
  before(:each) do
    assign(:tests_ajaxes, [
      stub_model(Tests::Ajax,
        :name => "Name",
        :description => "MyText"
      ),
      stub_model(Tests::Ajax,
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of tests/ajaxes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
