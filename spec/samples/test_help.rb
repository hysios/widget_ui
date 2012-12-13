require 'rubygems'
require 'bundler'
Bundler.setup

ENV['RAILS_ENV'] = 'test'

Apotomo::Widget.append_view_path(File.expand_path("../widgets", File.dirname(__FILE__)))

require "dummy/config/environment"
require "rails/test_help" # sets up ActionController::TestCase's @routes

