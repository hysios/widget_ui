module WidgetUI
  class WidgetsBuilder < DSL::Builder
    WIDGETS_METHOD_PREFIX = "create_"

    def method_missing(_name, *args, &block)
      name = _name.to_s
      if name.start_with?(WIDGETS_METHOD_PREFIX) && args.size > 0
        base_name = name[WIDGETS_METHOD_PREFIX.length..-1].to_sym
        class_name = case class_name = args.shift
                      when Symbol
                        class_name.to_s
                      when String
                        class_name
                      else
                        raise ArgumentError.new("invalid class, must contains below `Symbol' `String'")
                      end

        register_widget base_name, *args

        widget_klass = ExtendWidget.generator(widget_symbol(class_name), base_name)
        
        register_widget class_name, *args

        cb = DSL::ControlsBuilder.new(@controller_class, widget_klass).dispatch(&block)
      else
        super
      end        
    end

    def widget_symbol(name)
      "#{name}_widget".to_sym
    end

    def register_widget(name, *args)
      controller_class.has_widgets do |root|
        root << widget(name, *args)
      end
    end

    protected
      def controller_class
        @controller_class
      end
  end
end