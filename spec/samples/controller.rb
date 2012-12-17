require File.expand_path '../test_help', __FILE__
module MockController
  class Base < ActionController::Base
    extend WidgetUI::Rails::ControllerMethodsLoader
    extend Apotomo::Rails::ControllerMethodsLoader
    include Apotomo::Rails::ControllerMethodsLoader
	  include WidgetUI::Rails::ControllerMethodsLoader
    include Rails.application.routes.url_helpers


    def trigger(type, source, options={})
	    source = apotomo_root.find_widget(source)
	    source.fire(type, options)
	    apotomo_root.page_updates
    end
  end
end