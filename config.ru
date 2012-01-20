require "rubygems"
require "bundler/setup"

Bundler.require(:default, ENV["RACK_ENV"])
$LOAD_PATH.unshift File.join(File.dirname(__FILE__), "lib")

require "time_budget"

run TimeBudget::Application.new