require 'spec_helper'

describe Email do
  
  let!(:email) { FactoryGirl::create(:email) }
  
  subject { @email }
  
  it { respond_to :emailable }
  it { respond_to :infos }
  it { respond_to :private }
  
  it { should be_valid }
  
  describe "when emailable is not present" do
    before { email.followed_id = nil }
    it { should_not be_valid }
  end
  
  
  
end
