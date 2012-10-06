source 'https://rubygems.org'

gem 'rails', '3.2.5'
gem 'pg', '0.12.2'

gem "meta_search"

# Bootstrap and layouting
gem 'bootstrap-sass', '2.0.3'
gem 'will_paginate', '3.0.3'
gem 'bootstrap-will_paginate', '0.0.6'
gem 'rails3-jquery-autocomplete'
gem 'formtastic-bootstrap'
#gem 'bootstrap-datepicker-rails'
#gem 'bootstrap-timepicker-rails'

#test support
gem 'faker', '1.0.1'

#login rules
gem 'devise'
gem 'cancan'

#criptar
gem 'bcrypt-ruby', '3.0.1'

#BR
gem 'brazilian-rails'
gem 'rails-i18n'

group :development do
	gem 'annotate', '~> 2.4.1.beta'
	gem 'nested_scaffold'
end

group :development, :test do
  gem 'rspec-rails', '2.11.0'
  gem 'guard-rspec', '0.5.5'
  gem 'guard-spork', '0.3.2'
  gem 'spork', '0.9.0'
  gem 'ruby-debug19'
  gem 'linecache19'
  gem 'factory_girl_rails', '1.4.0'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '3.2.4'
  gem 'coffee-rails', '3.2.2'
  gem 'uglifier', '1.2.3'
end

gem 'jquery-rails'

group :test do
  gem 'capybara', '1.1.2'
  gem 'capybara-webkit', '0.12.1'
  gem "launchy"
  gem 'ZenTest'
  #MAC OS Especific
  gem 'rb-fsevent', '0.4.3.1', :require => false
  gem 'growl', '1.0.3'

  #Cucumber
  gem 'cucumber-rails', '1.2.1', :require => false
  gem 'database_cleaner', '0.7.0'
end

group :production do
  #gem 'pg', '0.12.2'
end