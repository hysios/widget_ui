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
        def widgets_binding(&block)
          begin 
            wb = WidgetUI::WidgetsBuilder.new(self)
            wb.dispatch(&block)

            build_widget_tree wb.root
#            wb.widget_tree
          rescue Exception => e
            raise
          end
        end

        # define_hook :after_initialize

        def build_widget_tree(node_root)
          has_widgets do |root|
            node_root.children.each do |node|
              add_widget(root, node)
            end
          end
        end


      end

      def add_widget(parent, node)
        parent << current = widget(node.type, node.name, *node.args)
        if node.children.size > 0
          node.children.each do |node|
            add_widget(current, node)
          end
        end
      end      
    end
  end
end