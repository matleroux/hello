$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "hello/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "hello"
  s.version     = Hello::VERSION
  s.authors     = ["James Pinto", "Michal Papis"]
  s.email       = ["thejamespinto@gmail.com", "mpapis@gmail.com"]
  s.homepage    = "http://github.com/hello-gem/hello"
  s.summary     = "Rails Gem to authenticate you and your users"
  s.description = "We want enjoyable Rails authentication"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.test_files = Dir["spec/**/*"]

  s.add_runtime_dependency "before_actions"
  s.add_runtime_dependency "colorize"
  s.add_runtime_dependency "user_agent_parser"
  s.add_runtime_dependency "http_accept_language"
  s.add_runtime_dependency "rails-i18n"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'email_spec'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'codeclimate-test-reporter'
  s.add_development_dependency 'bdd'
  s.add_development_dependency 'bcrypt', '~> 3.1'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'omniauth-facebook'

  # save_and_open_page
  s.add_development_dependency 'launchy'
end
