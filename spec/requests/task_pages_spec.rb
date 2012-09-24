require 'spec_helper'

include UserAbilitiesHelper

describe "Customer Task Pages" do
  
  before(:all) { clear_test_dummy }
  
  subject { page }
  
  let (:admin) { Factory(:admin) }
  let (:user) { Factory(:user) }
  let!(:customer_pj) { Factory(:customer_pj) }
  let!(:contact) { Factory(:contact, customer: customer_pj.customer) }
  let (:task) { Factory(:task, user: user, interested: customer_pj ) }

  before do
    #rights
    able(user, :read,  :customer)
    able(user, :read,  :customer_pj)
    able(user, :read,  :task)
    able(user, :write, :task)
    
    #reload customer
    #customer_pj.customer.stub(:contacts).and_return([mock(:contact, name: "test1")])
    #FactoryGirl.create(:contact, customer: customer_pj.customer)
    #customer_pj.customer.contacts.reload
    #puts customer_pj.customer.contacts.to_yaml
    
    #sign_in
    sign_in user
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
    it { should have_content(I18n.t("tasks.new.link")) }
    it { find("div.tasks .new .form").should_not be_visible }    
    
    describe "only user with rights can see and click in new task" do
      pending("do this rights")
    end
    
    describe "click on new link on side panel", :js => true do
      before do
        click_on I18n.t("tasks.new.link")
        wait_until_visible("div.tasks .new .form")
      end
      it { find("div.tasks .new .form").should be_visible }
      
      describe "add valid task" do
        before do
          #save_and_open_page
          fill_in I18n.t("tasks.name"),      with: Faker::Name.first_name
          fill_in I18n.t("tasks.due_time"),  with: (Time.now + 2.days).strftime("%d/%m/%Y %H:%m")
          select contact.name, from: I18n.t("tasks.contact")
          select user.name, from: I18n.t("tasks.assigned")
          fill_in I18n.t("tasks.notes"),     with: Faker::Lorem.sentence(5)
        end
        
        it { expect{ click_on I18n.t("helpers.forms.save") }.to change(Task, :count).by(+1) }
      end
    end
    
  end



end