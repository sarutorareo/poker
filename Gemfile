source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.13', '< 0.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  # 2016/3/14 herokuではPostgresqlで動かす必要があるため、'pg'を追加
  gem 'pg'
  # 2016/3/14 herokuで必要があるため、'rails_12factor'を追加
  gem 'rails_12factor'
end


# 2016/3/17 WebSocket
gem 'websocket-rails'
gem 'faye-websocket', '0.10.0'

# 2016/3/20 テスト用にfactory girlを追加
group :test do
  gem 'factory_girl_rails', '~> 4.4.0'
end

# 2016/3/20 ページ遷移時にjqueryが動かない場合があるため、以下を追加
gem 'jquery-turbolinks'

# 2016/3/24 デバッグ用にrails footnotesを追加
group :development do
  gem 'rails-footnotes'
  gem 'better_errors' # Better Errors本体
  gem 'binding_of_caller' # Better Errors上でREPLを使用するためのgem
end

# 2016/3/24 デバッグ用にpry群を入れる
group :development, :test do
  gem 'pry-rails'  # rails console(もしくは、rails c)でirbの代わりにpryを使われる
  gem 'pry-doc'    # methodを表示
  gem 'pry-byebug' # デバッグを実施(Ruby 2.0以降で動作する)
  gem 'pry-stack_explorer' # スタックをたどれる
end

# 2016/3/26 テスト用にrspec-railsを入れる
group :development, :test do
  gem 'rspec-rails'
end

# 2016/4/3 コンソールへのオブジェクト出力を見やすくするためHirb導入
group :development, :test do
  gem 'hirb'
  gem 'hirb-unicode'
end
