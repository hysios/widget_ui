class SampleController < ActionController::Base
    extend WidgetUI::Rails::ControllerMethodsLoader
    extend Apotomo::Rails::ControllerMethodsLoader
    include Apotomo::Rails::ControllerMethodsLoader
	  include WidgetUI::Rails::ControllerMethodsLoader

  	widgets_binding do
      create_button :new_content do 
        on_click do
          puts "alert('hi baby');"
          # render :js => "alert('hi baby');"
        end
      end
    end

    def trigger(type, source, options={})
	    source = apotomo_root.find_widget(source)
	    source.fire(type, options)
	    apotomo_root.page_updates
    end	
end