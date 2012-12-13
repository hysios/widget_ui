module WidgetUI
  module OptionMethods
    extend ActiveSupport::Concern

    module ClassMethods

      def define_option(name, method_name, &block)
        option_methods << {:name => name, :method => method_name}
      end

      def option_methods
        @option_methods ||= []
      end
    end
  end
end