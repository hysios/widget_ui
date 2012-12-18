module WidgetUI
  module Rails
    # Lazy loader
    module ControllerMethodsLoader
      def widgets_binding(&block)
        include ControllerMethods
        widgets_binding(&block)        
      end
    end

    module ControllerMethods
      extend ActiveSupport::Concern
      module ClassMethods

        def widgetui_blocks
          @widgetui_blocks ||= []
        end

        def widgets_binding(&block)
          widgetui_blocks << block
        end

        # define_hook :after_initialize
      end

      def widget_builder
        @builder ||=
          begin 
            wb = WidgetUI::WidgetsBuilder.new(self)
            self.class.widgetui_blocks.each do |block|
              wb.dispatch(&block)
            end

            build_widget_tree wb.root
#            wb.widget_tree
          rescue Exception => e
            raise
          end        
      end

      def build_widget_tree(node_root)
        self.class.has_widgets do |root|
          node_root.children.each do |_node|
            add_widget(root, _node)
          end
        end
      end      

      def render_widget(*args, &block)
        build_widget_tree
        super
      end

      def add_widget(parent, _node)
        current = parent << widget(_node.type, _node.name, *_node.args)

        if _node.children.size > 0
          _node.children.each do |__node|
            add_widget(current, __node)
          end
        end
      end      
    end
  end
end