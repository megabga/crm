require 'spec_helper'

describe CustomerPf do
  
  before do
    @customerPf = CustomerPf.new :setor => "RH", :cargo => "Gestor"
  end
  
  subject { @customerPf }
  
  it { should respond_to(:emails) }
  it { should respond_to(:setor) }
  it { should respond_to(:cargo) }
  
  describe "Relationship 1 to 1 Customer" do
    before do 
      customer = Customer.new(:name => "Teste n");
      @customerPf.customer = customer
    end
    
    it { should be_valid }
  end
  
end
