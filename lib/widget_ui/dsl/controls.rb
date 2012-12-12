module WidgetUI
  module DSL
    class ControlsBuilder < Builder

      ON_METHOD_PREFIX = "on_"

      def initialize(controller_class, klass)
        @klass = klass
        super(context)
      end

      def method_missing(_name, *args, &block)
        name = _name.to_s
        if name.start_with?(ON_METHOD_PREFIX)
          event_name = extract_method_name name
          bind_event event_name, *args, &block
        end
      end

      protected
        def extract_method_name(name)
          name[ON_METHOD_PREFIX.size..-1].to_sym
        end

        def bind_event(name, *args, &block)
          @klass.bind(name, *args, &block)
        end
    end
  end
end