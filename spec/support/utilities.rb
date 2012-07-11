
include ApplicationHelper

#def full_title(page_title)
#  base_title = "Ruby on Rails Tutorial Sample App"
#  if page_title.empty?
#    base_title
#  else
#    "#{base_title} | #{page_title}"
#  end
#end

def sign_in(user)
  visit signin_path
  fill_in I18n.t("session.email"),    with: user.email
  fill_in I18n.t("session.password"), with: user.password
  click_button I18n.t("sign.in.link")
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end