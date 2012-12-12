module WidgetUI
  module Rails
    # Lazy loader
    module ControllerMethodsLoader
      def widgets_binding(&block)
        include ControllerMethods
        widgets_binding(&block)        
      end
    end

    module ControllerMethods
      extend ActiveSupport::Concern

      module ClassMethods

        def widgets_binding(&block)
          begin 
            WidgetUI::WidgetsBuilder.new(self).dispatch(&block)
          rescue Exception => e
            raise
          end
        end
      end
    end
  end
end