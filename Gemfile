source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3', '>= 6.0.3.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'slim-rails'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'rails-i18n', '~> 6.0'
gem 'bootsnap', '>= 1.4.2', require: false

# Devise
gem 'devise'
gem 'devise-i18n'
gem 'devise-bootstrap-views'

# Markdown, syntax
gem 'redcarpet'
gem 'rouge'

# Paginator
gem 'kaminari'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'bullet'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'rubocop-performance', require: false
  gem 'scss_lint', require: false
  gem 'slim_lint', require: false
  gem 'guard', require: false
  gem 'guard-rspec', require: false
  gem 'brakeman', require: false
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
