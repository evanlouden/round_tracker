source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "bootsnap", ">= 1.4.2", require: false
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.3"
gem "rails", "~> 6.0.2", ">= 6.0.2.2"
gem "simple_form", "~> 5.0.2"
gem "webpacker", "~> 5"

group :development, :test do
  gem "pry-byebug"
  gem "pry-rails"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.3"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end
