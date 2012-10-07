require 'spec_helper'

describe "Contacts Customer" do
  
  subject { page }
  
  #login
  let(:user) { FactoryGirl.create(:user) }
  before do
    able_update(user, SystemModule.CUSTOMER)
    able_update(user, SystemModule.CONTACT)
    sign_in user
  end
  
  #customer neasted
  let(:customer) { FactoryGirl.create(:customer_pj).customer }
  
  
  describe "access in customer form" do
    before do
       visit edit_customer_path(customer)
    end
    
    it { should have_selector("title", text: I18n.t("customers.edit.title")) }
    it { have_link(I18n.t('customer.contacts.link'), href: customer_contacts_path(customer)) }
    
    it "acess contacts from customers" do
       click_link I18n.t('customers.contacts.link')
       should have_selector("title", text: I18n.t("customers.contacts.title", :customer => customer.name))
    end
  end
  
  describe "Contacts creation" do
    before do
       able_create(user, SystemModule.CONTACT)
       visit new_customer_contact_path(customer)
    end
    
    describe "with invalid information" do
      it "it should not change contacts" do
        expect { click_button autotitle_create('Contact')  }.to_not change(Contact, :count)
      end
    end
    
    describe "with invalid information" do
      let(:name) { "Contact test" }
      before do
        fill_in I18n.t("customers.contacts.name"),     with: name
      end
      it "it should create contact" do
        expect { click_button autotitle_create('Contact') }.to change(Contact, :count).by(+1)
      end
    end
    
  end
  
end