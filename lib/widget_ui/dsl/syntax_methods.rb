module WidgetUI
  module DSL
    module SyntaxMethods

      def prefix_create_method(base_name, *args, &block)
        class_name = case class_name = args.shift
                      when Symbol
                        class_name.to_s
                      when String
                        class_name
                      else
                        raise ArgumentError.new("invalid class, must contains below `Symbol' `String'")
                      end

        add_widget class_name.to_sym, base_name, *args

        # widget_klass = ExtendWidget.generator(widget_symbol(class_name), base_name)
        widget_klass = "#{base_name}_widget".classify.constantize
        # add_widget class_name.to_sym, *args
        cb = DSL::ControlsBuilder.new(@controller_class, widget_klass, node_for(base_name))
        cb.dispatch(&block) if block_given? 
      end

      def widget_symbol(name)
        "#{name}_widget".to_sym
      end

      def node_for(name)
        root.children.find {|node| node.name == name}
      end

      def root
        @root ||= NodeHash.new
      end

      def add_widget(name, type,  *args)
        root << NodeHash.new(name, type, *args) unless root.find(name)
      end

      protected
      def controller_class
        @controller_class
      end

      class NodeHash < Hash
        def initialize(name = :root, type = nil, *args)
          self[:name] = name
          self[:args] = args
          self[:type] = type || name
        end

        def type
          self[:type]
        end

        def <<(node)
          children << node
        end

        def name
          self[:name]
        end

        def args
          self[:args] ||= []
        end

        def find(name)
          found = children.find do |node|
            break node if node.name == name
            break node if node = node.find(name)
          end
        end

        def children
          self[:children] ||= []
        end
      end      
    end
  end
end