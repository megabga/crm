require 'spec_helper'

describe "TaskTypes" do
  describe "GET /task_types" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get task_types_path
      response.status.should be(302) #200
    end
  end
end