require 'spec_helper'

include UserAbilitiesHelper

describe "Customer Task Pages" do
  
  before(:all) { clear_test_dummy }
  
  subject { page }
  
  let (:admin) { FactoryGirl.create(:admin) }
  let (:user) { FactoryGirl.create(:user) }
  let (:customer_pj) { FactoryGirl.create(:customer_pj)}
  let (:contact) { FactoryGril.create(:contact)}

  before do
    able(user, :read,  :customer)
    able(user, :read,  :customer_pj)
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
          fill_in I18n.t("tasks.name"),      with: Faker::Name.first_name
          fill_in I18n.t("tasks.due_time"),  with: Time.now + 2.days
          select I18n.t("tasks.contact"),    with: contact.name
          select I18n.t("tasks.assigned"),   with: user.name
          fill_in I18n.t("tasks.notes"),     with: Faker::Lorem.sequence(5)
        end
        
        it { excpect(click_on I18n.t("helpers.forms.save")).to change(Task, :count).by(+1) }
      end
    end    
    
  end



end