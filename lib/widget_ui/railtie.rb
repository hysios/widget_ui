require "rails/railtie"

module Apotomo
  class Railtie < ::Rails::Railtie

    # Include a lazy loader via has_widgets.
    initializer 'apotomo.add_has_widgets' do |app|
      ActionController::Base.extend WidgetUI::Rails::ControllerMethodsLoader
    end
  end 
end