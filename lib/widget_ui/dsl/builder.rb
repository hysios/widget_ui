module WidgetUI
  module DSL
  	class Builder

      def initialize(controller)
        @controller = controller
      end

      def dispatch(&block)
        self.instance_exec(&block)
      end
  	end
  end
end