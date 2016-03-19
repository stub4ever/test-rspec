# spec/support/factory_girl.rb

#This file will lint your factories before the test suite is run.
# That is, it will ensure that all the factories you define are valid.

RSpec.configure do |config|
  #FG Methods loaded into global context in support/factory_girl.rb
  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
  end
end

# FactoryGirl.lint may end up persisting some records to the database,
# we use Database Cleaner to restore the state of the database after we’ve
# linted our factories.

