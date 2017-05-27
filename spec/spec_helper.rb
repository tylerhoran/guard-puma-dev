require 'rspec'
require 'guard/puma_dev'

RSpec.configure do |config|
  config.color = true
  config.run_all_when_everything_filtered = true
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end
