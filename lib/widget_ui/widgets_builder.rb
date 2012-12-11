module WidgetUI
  class WidgetsBuilder < DSL::Builder
    WIDGETS_METHOD_PREFIX = "create_"

    def method_missing(_name, *args, &block)
      name = _name.to_s
      if name.start_with?(WIDGETS_METHOD_PREFIX) && args.size > 0
        base_name = name[WIDGETS_METHOD_PREFIX.length..-1].classify
        class_name = case class_name = args.shift
                      when Symbol
                        class_name.to_s.classify
                      when String
                        class_name.classify
                      else
                        raise ArgumentError.new("invalid class, must contains below `Symbol' `String'")
                      end

        widget_constant = ExtendWidget.generator(class_name + "Widget", base_name)

        cb = DSL::ControlsBuilder.new(widget_constant, &block)
      else
        super
      end        
    end
  end
end