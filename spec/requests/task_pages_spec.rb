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
      visit customer_path(customer_pj.customer)
    end
    
    it { should have_content(I18n.t("tasks.side.title")) }
    it { should have_content(I18n.t("tasks.side.new.link") }
    
    describe "click on new link on side panel" do
      before do
        click_in I18n.t("tasks.side.new.link")
      end
      it { have_css("div.task.new") }
      it { find("div.task.new").should be_visible }
    end    
    
  end



end