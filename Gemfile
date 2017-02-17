source 'https://rubygems.org'

branch = ENV.fetch('SOLIDUS_BRANCH', 'master')
gem 'solidus', github: 'solidusio/solidus', branch: branch

if branch == 'master' || branch >= 'v2.0'
  gem 'rails-controller-testing', group: :test
else
  gem 'rails', '~> 4.2.7' # workaround for bundler resolution issue
  gem 'rails_test_params_backport', group: :test
end

gem 'mysql2'
gem 'pg'

gemspec
