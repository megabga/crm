require 'spec_helper'

include UserAbilitiesHelper

describe "Customer Task Pages" do
  
  before(:all) { clear_test_dummy }
  
  subject { page }
  
  let (:admin) { FactoryGirl.create(:admin) }
  let (:user) { FactoryGirl.create(:user) }
  let (:customer_pj) { FactoryGirl.create(:customer_pj)}
  

  before(:all) do
    able(user, :read,  :customer)
    able(user, :read,  :contact)
    able(user, :read,  :task)
    able(user, :write, :task)
    sign_in user
    FactoryGirl.create(:task, user: user, interested: customer_pj )
  end
  
  after(:all) do
    Customer.destroy_all
    User.destroy_all
  end

  describe "side panel with the history of the tasks related to customer" do
    before do
      visit customer_path(customer_pj)
    end
    
    it { sould have_content(I18n.t("customers.tasks.side.title")) }
    
    
  end

  describe "" do
    
  end

end