require 'spec_helper'

describe Task do
  
  
  before(:all) { clear_test_dummy }
  
  before do
    
    customer_pj = FactoryGirl.create(:customer_pj)
    contact = FactoryGirl.create(:contact, customer: customer_pj.customer)
    user = FactoryGirl.create(:user)
    
    @task = Task.create(name: "task "+Faker::Lorem.sentence(4),
                       interested: customer_pj,
                       contact: contact,
                       user: user,
                       assigned: user,
                       notes: Faker::Lorem.sentence(60)[0..139],
                       description: Faker::Lorem.sentence(140)[0..999],
                       due_time: Date.today + 10.days,
                       finish_time: nil,
                       status: SystemTaskStatus.OPENED,
                       resolution: nil,
                       type: FactoryGirl.create(:task_type)
                       )
  end
  
  subject { @task }
  
  it { should respond_to(:interested) }
  it { should respond_to(:name) }
  it { should respond_to(:contact) }
  it { should respond_to(:user) }
  it { should respond_to(:assigned) }
  it { should respond_to(:notes) }
  it { should respond_to(:description) }  
  it { should respond_to(:due_time) }
  it { should respond_to(:finish_time) }
  it { should respond_to(:status) }
  it { should respond_to(:resolution) }
  it { should respond_to(:type) }
  it { should respond_to(:assigned) }
  it { should respond_to(:feedbacks) }
  
  it { should be_valid }
  
  describe "specials accessible fields" do
    it "attr user must be accessible" do
      expect do
        @task.user = nil
      end.should_not raise_error(ActiveModel::MassAssignmentSecurity::Error)  
    end
    
    it "attr status must be accessible" do
      expect do
        @task.status = nil
      end.should_not raise_error(ActiveModel::MassAssignmentSecurity::Error)  
    end
  end  
    
  describe "required fields must be checked" do
    before do
       @task.status = SystemTaskStatus.CLOSED
       @task.resolution = SystemTaskResolution.RESOLVED
    end
    
    describe "and invalid status equals nil" do
      before { @task.status = nil }
      it { should be_invalid }
    end
    
    describe "and invalid user equals nil" do
      before { @task.user = nil }
      it { should be_invalid }
    end
    
    describe "invalid status for RESOLVED and OPENED" do
      before { @task.status = SystemTaskStatus.OPENED }
      it { should be_invalid }
    end
    
    describe "invalid notes is empty" do
      before { @task.notes = '' }
      it { should be_invalid }
    end
    
    describe "invalid name" do
      before { @task.name = 'a' }
      it { should be_invalid }
    end
    
    describe "empty name" do
      before { @task.name = '' }
      it { should be_invalid }
    end
    
    describe "empty status is invalid" do
      before do
        @task.status = nil
      end

      it { should be_invalid }
    end
  end
  
  describe "is done and valid" do
    before do
      @task.resolution = SystemTaskResolution.RESOLVED
      @task.status = SystemTaskStatus.CLOSED
    end
    
    it { should be_valid }
  end
  
  
  describe "STATUS is OPENED and resolution is not valid" do
    before { @task.status = SystemTaskStatus.OPENED }
    
    describe "try RESOLVED resolution" do
      before { @task.resolution = SystemTaskResolution.RESOLVED }
      it { should be_invalid }
    end
  
    describe "try CANCELED resolution" do
      before { @task.resolution = SystemTaskResolution.CANCELED }
      it { should be_invalid }
    end  
  
  
    describe "try BLOCKED resolution" do
      before { @task.resolution = SystemTaskResolution.BLOCKED }
      it { should be_invalid }
    end
  end
  
  describe "'s associated with a CUSTOMER destroyed, must also be destroyed"
    it { expect(customer_pj.destroy_fully).to change(Task).by(-1) }
  end

end
