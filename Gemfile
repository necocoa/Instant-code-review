source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails'
gem 'pg'
gem 'puma', '~> 4.1'
gem 'sass-rails'
gem 'slim-rails'
gem 'webpacker', '~> 4.0'
gem 'turbolinks'
gem 'jbuilder'
gem 'rails-i18n'
gem 'bootsnap', require: false
gem 'seed-fu'

# Font Awesome
gem 'font-awesome-sass'

# Devise
gem 'devise'
gem 'devise-i18n'

# Markdown, syntax
gem 'redcarpet'
gem 'rouge'

# Paginator
gem 'kaminari'

# Statically page
gem 'high_voltage'

# Application protection, monitoring
gem 'sqreen'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'bullet'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'annotate'
  gem 'rubocop', '~> 1.1', require: false
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
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
