source 'https://rubygems.org'

gem 'rails', '~> 8.0.1'

gem 'cssbundling-rails'
# リリースされているdevseiがrails8に対応していないため、mainブランチを指定
gem 'devise', git: 'https://github.com/heartcombo/devise', branch: 'main'
gem 'haml-rails'
gem 'jsbundling-rails'
gem 'pg'
gem 'propshaft'
gem 'puma'
gem 'simple_form'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'bootsnap', require: false

group :development, :test do
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'debug'
  gem 'factory_bot_rails'
  gem 'haml_lint'
  gem 'html2haml'
  gem 'rspec-rails'
  gem 'sgcop', github: 'SonicGarden/sgcop', branch: 'main'
end

group :development do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'web-console'
end
