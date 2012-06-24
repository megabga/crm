require 'spec_helper'

describe "BusinessActivits" do
  describe "GET /business_activits" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get business_activits_path
      response.status.should be(200)
    end
  end
end
