module WidgetUI
  module DSL
  	class Builder

      def initialize(controller_class)
        @controller_class = controller_class
      end

      def dispatch(&block)
        self.instance_exec(&block)
      end
  	end
  end
end