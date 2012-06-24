require 'spec_helper'

describe "business_segments/new" do
  before(:each) do
    assign(:business_segment, stub_model(BusinessSegment,
      :name => "MyString",
      :disable => false
    ).as_new_record)
  end

  it "renders new business_segment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => business_segments_path, :method => "post" do
      assert_select "input#business_segment_name", :name => "business_segment[name]"
      assert_select "input#business_segment_disable", :name => "business_segment[disable]"
    end
  end
end
