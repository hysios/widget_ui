module WidgetUI
  module DSL
    class ControlsBuilder < Builder
      include WidgetUI::DSL::SyntaxMethods

      ON_METHOD_PREFIX = "on_"
      WIDGETS_METHOD_PREFIX = "create_"
      
      def initialize(controller_class, klass, node)
        @klass = klass
        @root = node
        super(controller_class)
      end

      def method_missing(_name, *args, &block)
        name = _name.to_s
        if name.start_with?(ON_METHOD_PREFIX)
          event_name = extract_method_name name
          bind_event event_name, *args, &block
        elsif name.start_with?(WIDGETS_METHOD_PREFIX)
          method_name = name[WIDGETS_METHOD_PREFIX.length..-1].to_sym
          prefix_create_method method_name, *args, &block          
        elsif option_name = @klass.option_methods.find {|m| m[:name] == _name}
          @klass.after_initialize self do 
            self.send(option_name[:method], *args, &block)
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