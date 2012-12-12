module WidgetUI
  class WidgetsBuilder < DSL::Builder
    include DSL::SyntaxMethods

    WIDGETS_METHOD_PREFIX = "create_"

    def method_missing(_name, *args, &block)
      name = _name.to_s
      if name.start_with?(WIDGETS_METHOD_PREFIX) && args.size > 0
        method_name = name[WIDGETS_METHOD_PREFIX.length..-1].to_sym
        prefix_create_method method_name, *args, &block
      else
        super
      end
    end
  end
end