ENV['RUBY_ENV'] = ENV['RACK_ENV'] = 'test'

require 'simplecov'
require 'simplecov-rcov'
SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
SimpleCov.start do
  add_filter '/spec/'
end

require File.expand_path('../../config/environment', __FILE__)

RSpec.configure do |config|
  config.order = 'random'
end
