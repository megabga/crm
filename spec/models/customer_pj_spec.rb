require 'spec_helper'

describe CustomerPj do
  
  before do
    
    #:doc, :doc_rg, :name, :name_sec, :address, :birthday, :state_id, :city_id, :district_id, :customer_pj, :is_customer
     @customer = Customer.new(doc: "23532278000105", doc_rg: "000182", name: "Example Customer", name_sec: "Name Sec",
                              address: "Rua B, Plano A",
                              birthday: "19/01/1900", state_id: 1, city_id: 1, district_id: 1, 
                              emails: [Email.new(email: "example@example.com")])
                              
     @customer.person = CustomerPj.new(fax: "859998887", total_employes: 230)
     
     @customer.person.segments = [BusinessSegment.new(name: "Seg. Test 1" ),
                                  BusinessSegment.new(name: "Seg. Test 2" ),
                                  BusinessSegment.new(name: "Seg. Test 3" )]
                                  
     @customer.person.activities = [BusinessActivity.new(name: "Activity Test 1"),
                                    BusinessActivity.new(name: "Activity Test 2")]
   end
  
  subject { @customer.person }
  
  it { respond_to :fax }
  it { respond_to :segments }
  it { respond_to :activities }
  
  it { should be_valid }
  
  describe "validate on default attributes" do
    describe "should be valid on CNPJ zeros" do
      before { @customer.doc = "0"*14 }
      it { should be_valid }
    end
    
  end
  
  describe "invalidate on invalid attributes" do
    describe " on CNPJs invalids " do
      before { @customer.doc = "00000000010000" }
      it { @customer.should_not be_valid }
    end
  end
  
  describe "accessible attributes" do
    it "should allow access to basics fields" do
      expect do
        @customer.save
      end.should_not raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end
  
end
