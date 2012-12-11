module WidgetUI
  module ControllerMethods
    extend ActiveSupport::Concern

    module ClassMethods

      def widgets_binding(&block)
        WidgetUI::DSL::DSLBuilder.new(&block).dispatch
      end
    end
  end
end