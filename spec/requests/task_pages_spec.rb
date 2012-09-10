require 'spec_helper'

include UserAbilitiesHelper

describe "Customer Task Pages" do
  
  subject { page }
  
  let (:admin) { FactoryGirl.create(:admin) }
  let (:user) { FactoryGirl.create(:user) }
  let (:customer_pj) { FactoryGirl.create(:customer_pj)}
  

  before(:all) do
    sign_in admin
    customer_pj.customer.tasks << FactoryGirl.create(:task)
  end
  
  after(:all) do
    Customer.destroy_all
  end

  describe "side panel with the history of the tasks related to customer" do
    before do
      visit show_customer_path(customer_pj)
    end
    
    it { sould have_content(I18n.t("customers.tasks.side.title")) }
    
    
  end


end