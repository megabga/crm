require 'spec_helper'

describe "system_task_status/edit" do
  before(:each) do
    @system_task_statu = assign(:system_task_statu, stub_model(SystemTaskStatu,
      :name => "MyString"
    ))
  end

  it "renders the edit system_task_statu form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => system_task_status_path(@system_task_statu), :method => "post" do
      assert_select "input#system_task_statu_name", :name => "system_task_statu[name]"
    end
  end
end
