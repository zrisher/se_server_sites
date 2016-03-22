source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Use sqlite3 as the database for Active Record
gem 'sqlite3'

# Use Zanobo's library of Rails helpers
gem 'zanobo_rails', git: 'https://github.com/zanobo/zanobo_rails'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
#gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
#gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#
# = Auth
#
gem 'devise'
gem 'omniauth'
gem 'omniauth-steam'
gem 'cancancan'

#
# = App
#
gem 'rails_admin'
gem 'redcarpet'

#
# = Dev tools
#
group :development, :test do

  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

end

#
# = Asset compilation
#
# Note the "staging" env used to keep asset comp gems out of memory
#
group :development, :test, :staging do

  # Stylesheet Assets
  gem 'sass-rails', '~> 5.0'          # Sass compiler
  gem 'bootstrap-sass', '~> 3.3.3'
  gem 'font-awesome-rails'            # FA icons

  # Javascript Assets
  gem 'therubyracer', platform: :ruby # js interpreter for *nix
  gem 'coffee-rails', '~> 4.1.0'      # CoffeeScript compiler
  gem 'uglifier', '>= 1.3.0'          # minification
  gem 'jquery-rails'
  gem 'turbolinks'

end
