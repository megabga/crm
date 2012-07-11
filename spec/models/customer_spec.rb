require 'spec_helper'

describe Customer do
  before do
    
   #:doc, :doc_rg, :name, :name_sec, :address, :birthday, :state_id, :city_id, :district_id, :customer_pj, :is_customer
   @customer = Customer.new(doc: "23532278000105", doc_rg: "000182", name: "Example Customer", name_sec: "Name Sec",
                              address: "Rua B, Plano A",
                              birthday: "19/01/1900", state_id: 1, city_id: 1, district_id: 1, 
                              emails: [Email.new(email: "example@example.com")])
                              
   end
   
   subject { @customer }
   
   it { respond_to :emails }
   it { respond_to :complete? }
   
   it { respond_to :contacts }
   
   
   describe "if record its complete" do
     describe "needs required fields" do
       before do
         @customer.complete = true
         @customer.doc = ""
       end
       it { should be_invalid }
     end
   end
   
   describe "Relationships with client" do
      before do       
        let!(:contact) { FactoryGirl.create(:contact, customer: @customer) }
        let!(:contact_other) { FactoryGirl.create(:contact, customer: @customer) }
      end

      it "customer has_many contacts " do
        @customer.contacts.should include(contact, contact_other)
      end
      
    end
end
