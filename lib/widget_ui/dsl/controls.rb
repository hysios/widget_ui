module WidgetUI
  module DSL
    class ControlsBuilder < Builder

      ON_METHOD_PREFIX = "on_"

      def initialize(controller_class, klass)
        @klass = klass
        super(controller_class)
      end

      def method_missing(_name, *args, &block)
        name = _name.to_s
        if name.start_with?(ON_METHOD_PREFIX)
          event_name = extract_method_name name
          bind_event event_name, *args, &block
        elsif option_name = @klass.option_methods.find {|m| m[:name] == _name}
          @klass.after_initialize self do 
            self.send(_name, *args, &block)
          end
        else
          super
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