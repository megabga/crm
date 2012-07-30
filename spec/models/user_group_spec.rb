require 'spec_helper'

describe UserGroup do
  
  let(:user) { FactoryGirl.create(:user) }
  let(:group) { FactoryGirl.create(:users_group) }
  let(:groups) { user.user_groups.build(users_group_id: group.id) }

  subject { groups }

  it { should be_valid }
  
  describe "grouping methods" do    
     it { should respond_to(:user) }    
     it { should respond_to(:users_group) }
     its(:user) { should == user }
     its(:users_group) { should == group }
   end

   describe "when user id is not present" do
     before { groups.user_id = nil }
     it { should_not be_valid }
   end

   describe "when follower id is not present" do
     before { groups.users_group_id = nil }
     it { should_not be_valid }
   end
  
end
