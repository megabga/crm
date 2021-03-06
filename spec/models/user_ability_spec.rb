require 'spec_helper'

describe UserAbility do

  let!(:user) { FactoryGirl.create(:user) }
  
  before do
    @user_ability = UserAbility.create!(:skilled => user, 
                                    :ability => SystemAbility.READ,
                                    :module => SystemModule.CUSTOMER)
                                    
    user.reload
  end

  subject { @user_ability }

  it { should respond_to :skilled }
  it { should respond_to :ability }  
  it { should respond_to :module }
  it { should respond_to :garant }
  it { UserAbility.should respond_to :for }
  
  it { should be_valid }
  
  describe "garant ability to user read cutomers " do
    it { user.abilities.should include @user_ability }
  end
  
  describe "list user abilities for module" do
    it "customer" do
      UserAbility.for(user, SystemModule.CUSTOMER).should include SystemAbility.READ
    end
  end
  
end
