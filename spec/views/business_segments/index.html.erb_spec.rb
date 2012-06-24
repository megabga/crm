require 'spec_helper'

describe "business_segments/index" do
  before(:each) do
    assign(:business_segments, [
      stub_model(BusinessSegment,
        :name => "Name",
        :disable => false
      ),
      stub_model(BusinessSegment,
        :name => "Name",
        :disable => false
      )
    ])
  end

  it "renders a list of business_segments" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
