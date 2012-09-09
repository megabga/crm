
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
  visit new_user_session_path
  fill_in I18n.t("session.email"),    with: user.email
  fill_in I18n.t("session.password"), with: user.password
  click_button I18n.t("sign.in.link")
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

def sign_out()
  #click_link I18n.t("sign.out.link")
  visit destroy_user_session_path
end

def able(user, ability_str, module_str)
  ability_model = SystemAbility.find_by_name(ability_str.upcase)
  module_model = SystemModule.find_by_name(module_str.titleize)
  user.abilities.build(:module => module_model, :ability => ability_model).save
end


### Botões automáticos
def autotitle_update(model_)
  "%s %s" % [I18n.t('helpers.forms.update'), I18n.t('activerecord.models.%s' % model_.to_s.downcase)]
end
def autotitle_create(model_)
  "%s %s" % [I18n.t('helpers.forms.create'), I18n.t('activerecord.models.%s' % model_.to_s.downcase)]
end

def autotitle_new(model_)
  "%s %s" % [I18n.t('helpers.forms.new'), I18n.t('activerecord.models.%s' % model_.to_s.downcase)]
end

















### @depracated
# TODO: refactor specs that used
def able_read(user, module_)
  user.abilities.build(:module => module_, :ability => SystemAbility.READ).save
end

def able_update(user, module_)
  user.abilities.build(:module => module_, :ability => SystemAbility.READ).save
  user.abilities.build(:module => module_, :ability => SystemAbility.UPDATE).save
end

def able_create(user, module_)
  user.abilities.build(:module => module_, :ability => SystemAbility.READ).save
  user.abilities.build(:module => module_, :ability => SystemAbility.CREATE).save
end

def able_read_to(user, module_to)
  able_read(user, SystemModule.find_by_name(module_to.titleize))
end