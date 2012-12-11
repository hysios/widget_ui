module WidgetUI
  class WidgetsBuilder < DSL::Builder
    WIDGETS_METHOD_PREFIX = "create_"

    def method_missing(name, *args, &block)
      name = name.to_s
      if name.start_with?(WIDGETS_METHOD_PREFIX)
        class_name = name[WIDGETS_METHOD_PREFIX.length..-1].classify

        widget_constant = ExtendWidget.generator(class_name + "Widget", name)

        cb = DSL::ControlsBuilder.new(widget_constant, &block)
      else
        super
      end        
    end
  end
end