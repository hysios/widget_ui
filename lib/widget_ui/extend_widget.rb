module WidgetUI
  module ExtendWidget
    class InvalidClassError < RuntimeError; end

    class << self
      def generator(class_name, base)
        base_class = base.to_s.classify
        klass = class_name.to_s.classify

        base_klass = find_widget base_class
        if base_klass < WidgetUI::UIBase
          widget_klass = inherit_widget_class klass, base_klass
        else
          raise InvalidClassError.new('must inherit WidgetUI::UIBase')
        end
      end

      def find_widget(name)
        constant_for(name)
      end

      def inherit_widget_class(class_name, base_klass)
        Object.module_eval("class #{class_name} < #{base_klass}; end ;#{class_name}")
      end

      private
        def constant_for(class_name)  # TODO: use Cell.class_from_cell_name. 
          "#{class_name}_widget".classify.constantize
        end
    end
  end
end