require 'spec_helper'

describe "system_task_status/show" do
  before(:each) do
    @system_task_statu = assign(:system_task_statu, stub_model(SystemTaskStatu,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
