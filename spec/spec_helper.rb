lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'widget_ui'
require 'apotomo/javascript_generator'
require File.expand_path('../samples/apotomo_setup', __FILE__)
 
require File.expand_path("../samples/button_widget", __FILE__)
require File.expand_path("../samples/page_widget", __FILE__)
require File.expand_path('../samples/controller', __FILE__)

