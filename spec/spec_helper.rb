lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'active_support'
require 'active_support/inflector'
require 'widget_ui/dsl'
require 'widget_ui/extend_widget'
require 'widget_ui/widgets_builder'
require 'widget_ui/controller_methods'

require File.expand_path('../samples/controller', __FILE__)