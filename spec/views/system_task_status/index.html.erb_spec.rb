require 'spec_helper'

describe "system_task_status/index" do
  before(:each) do
    assign(:system_task_status, [
      stub_model(SystemTaskStatu,
        :name => "Name"
      ),
      stub_model(SystemTaskStatu,
        :name => "Name"
      )
    ])
  end

  it "renders a list of system_task_status" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
