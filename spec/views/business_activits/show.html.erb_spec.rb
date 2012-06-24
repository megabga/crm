require 'spec_helper'

describe "business_activits/show" do
  before(:each) do
    @business_activit = assign(:business_activit, stub_model(BusinessActivit,
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
