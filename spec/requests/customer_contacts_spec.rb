require 'spec_helper'

describe "Contacts Customer" do
  
  subject { page }
  
  #login
  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }
  
  #customer neasted
  let(:customer) { FactoryGirl.create(:customer_pj).customer }
  
  
  describe "access in customer form" do
    before { visit edit_customer_path(customer) }
    
    it { should have_selector("title", text: I18n.t("customers.edit.title")) }
    it { have_link(I18n.t('customer.contacts.link'), href: customer_contacts_path(customer)) }
    
    it "acess contacts from customers" do
       click_link I18n.t('customers.contacts.link')
       should have_selector("title", text: I18n.t("customers.contacts.title", :customer => customer.name))
    end
  end
  
  describe "Contacts creation" do
    
    describe "with invalid information" do
      before { visit new_customer_contact_path(customer) }
      
      it " t should not create contact" do
        expect { click_button I18n.t('helpers.forms.create') }.should_not change(Contact, :count)
      end
    end
      

    describe "with invalid information" do
      let(:name) { "Contact test" }
      before do
        fill_in I18n.t("customers.contacts.name"),     with: name
      end
      it "it should create contact" do        
        expect { click_button I18n.t('helpers.forms.create', :customer => customer.name) }.should change(Contact, :count).by(+1)
      end
    end
    
  end
  
end