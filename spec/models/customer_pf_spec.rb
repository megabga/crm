require 'spec_helper'

describe CustomerPf do
  
  before do
    @customerPf = CustomerPf.new (:setor => "RH", :cargo => "Gestor")
  end
  
  subject { @customerPf }
  
  it { should respond_to(:emails) }
  it { should respond_to(:setor) }
  it { should respond_to(:cargo) }
  
  describe "Relationship 1 to 1 Customer" do
    @customer 
  end
  
end
