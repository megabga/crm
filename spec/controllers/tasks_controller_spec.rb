require 'spec_helper'

describe TasksController do
  
  def valid_attributes
    {}
  end
  
  def valid_session
    {}
  end
  
  
  it "get INDEX" do
    get :index
    assigns(:tasks).should eq([tasks])
  end
  
end