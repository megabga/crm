require 'spec_helper'

describe "business_segments/show" do
  before(:each) do
    @business_segment = assign(:business_segment, stub_model(BusinessSegment,
      :name => "Name",
      :disable => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/false/)
  end
end
