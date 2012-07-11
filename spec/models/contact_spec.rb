require 'spec_helper'

describe Contact do
  before do   
     @contact = Contact.new(
                  name: 'Teste Contact 1',
                  birthday: 35.years.ago,
                  customer: FactoryGirl.create(:customer))
   end
   
   subject { @contact }

   it { respond_to :name }
   it { respond_to :birthday }
   it { respond_to :phone }
   it { respond_to :customer }
   it { respond_to :contacts }
   it { respond_to :emails }
   
   it { should be_valid }
   
   describe "require name" do
     before do
       @contact.name = ""
     end
     it { should be_invalid }
   end
   
   describe "require customer" do
     before do
       @contact.customer = nil
     end
     it { should be_invalid }
   end
   
   describe "emails associations" do
     let!(:email) { FactoryGirl.create(:email, emailable: @contact) }
     let!(:email_private) { FactoryGirl.create(:email, emailable: @contact, private: true) }
     
     it { @contact.emails.should == [email, email_private] }
   end
   
end
