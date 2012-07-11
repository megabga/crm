require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h1',    text: I18n.t("sign.in.title")) }
    it { should have_selector('title', text: I18n.t("sign.in.title")) }
  end
  
  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
        before { click_button I18n.t("sign.in.link") }

        it { should have_selector('title', text: I18n.t("sign.in.title")) }
        it { should have_selector('div.alert.alert-error', text: I18n.t("sign.in.error")) }

        describe "after visiting another page" do
          before { click_link I18n.t("home.link") }
          it { should_not have_selector('div.alert.alert-error') }
        end
      end
    
      describe "with valid information" do
        let(:user) { FactoryGirl.create(:user) }
        before { sign_in user }

        it { should have_selector('title', text: user.name) }

        it { should have_link(I18n.t('customers.link'),    href: customers_path) }
        it { should have_link(I18n.t('users.profile.link'),  href: user_path(user)) }
        it { should have_link(I18n.t('users.settings.link'), href: edit_user_path(user)) }
        it { should have_link(I18n.t('sign.out.link'), href: signout_path) }

        it { should_not have_link(I18n.t('sign.in.link'), href: signin_path) }
        
        describe "followed by signout" do
          before { click_link I18n.t("sign.out.link") }
          it { should have_link(I18n.t("sign.in.link")) }
        end
      end
  end
  
  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "when attempting to visit a protected page" do
        before do
          visit edit_user_path(user)
          fill_in I18n.t("session.email"),    with: user.email
          fill_in I18n.t("session.password"), with: user.password
          click_button I18n.t("sign.in.link")
        end

        describe "after signing in" do

          it "should render the desired protected page" do
            page.should have_selector('title', text: I18n.t('users.edit.title'))
          end
        end
      end
      
      describe "in the Users controller" do

        describe "visiting the edit page" do
          before { visit edit_user_path(user) }
          it { should have_selector('title', text: I18n.t('sign.in.title')) }
        end

        describe "submitting to the update action" do
          before { put user_path(user) }
          specify { response.should redirect_to(signin_path) }
        end
        
        describe "visiting the user index" do
            before { visit users_path }
            it { should have_selector('title', text: I18n.t('sign.in.title')) }
          end
      end
      
      describe "in the Microposts controller" do

        describe "submitting to the create action" do
          before { post microposts_path }
          specify { response.should redirect_to(signin_path) }
        end

        describe "submitting to the destroy action" do
          before { delete micropost_path(FactoryGirl.create(:micropost)) }
          specify { response.should redirect_to(signin_path) }
        end
      end
      
    end
  
    describe "as wrong user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:wrong_user) { FactoryGirl.create(:user, name: "BLA BLA", email: "wrong@example.com") }
      before { sign_in user }

      describe "visiting Users#edit page" do
        before { visit edit_user_path(wrong_user) }
        it { should_not have_selector('title', text: full_title(I18n.t('users.edit.title'))) }
      end

      describe "submitting a PUT request to the Users#update action" do
        before { put user_path(wrong_user) }
        specify { response.should redirect_to(root_path) }
      end
    end
    
    describe "as non-admin user" do
      let(:user) { FactoryGirl.create(:user) }
      let(:non_admin) { FactoryGirl.create(:user) }

      before { sign_in non_admin }

      describe "submitting a DELETE request to the Users#destroy action" do
        before { delete user_path(user) }
        specify { response.should redirect_to(root_path) }        
      end
    end
    
  end
  
  
end