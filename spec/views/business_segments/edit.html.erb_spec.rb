require 'spec_helper'

describe "business_segments/edit" do
  before(:each) do
    @business_segment = assign(:business_segment, stub_model(BusinessSegment,
      :name => "MyString",
      :disable => false
    ))
  end

  it "renders the edit business_segment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => business_segments_path(@business_segment), :method => "post" do
      assert_select "input#business_segment_name", :name => "business_segment[name]"
      assert_select "input#business_segment_disable", :name => "business_segment[disable]"
    end
  end
end
