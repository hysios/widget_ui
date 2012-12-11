module WidgetUI
  module ControllerMethods
    extend ActiveSupport::Concern

    module ClassMethods

      def widgets_binding(&block)
        begin 
          WidgetUI::WidgetsBuilder.new(&block).dispatch
        rescue Exception => e
          raise
        end
      end
    end
  end
end