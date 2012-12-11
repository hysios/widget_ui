module WidgetUI
  module DSL
    class ControlsBuilder < Builder

      WIDGETS_METHOD_PREFIX = "create_"

      def initialize(name, &block)
        @class_name = name
        super(&block)
      end

      def method_missing(name, *args, &block)
        name = name.to_s
      end
    end
  end
end