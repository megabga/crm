require 'spec_helper'

describe Customer do
  before do
    
   #:doc, :doc_rg, :name, :name_sec, :address, :birthday, :state_id, :city_id, :district_id, :customer_pj, :is_customer
   @customer = Customer.new(doc: "23532278000105", doc_rg: "000182", name: "Example Customer", name_sec: "Name Sec",
                              address: "Rua B, Plano A",
                              birthday: "19/01/1900", 
                              state: FactoryGirl.create(:state),
                              city: FactoryGirl.create(:city),
                              district: FactoryGirl.create(:district))
                              
   end
   
   subject { @customer }
   
   it { respond_to :emails }
   it { respond_to :complete? }
   
   it { respond_to :contacts }
   
   
   describe "when record is complete" do
     describe "require essencials fields" do
       before do
         @customer.complete = true
         @customer.doc = ""
       end
       it { should be_invalid }
     end
   end
   
   describe "Relationships" do
      before do
        @customer.save
      end
      
      let(:contact)       { FactoryGirl.create(:contact, customer: @customer) }
      let(:contact_other) { FactoryGirl.create(:contact, customer: @customer) }
      
      it "has_many contacts" do
        @customer.contacts.should include(contact, contact_other)
      end
      
    end
end
