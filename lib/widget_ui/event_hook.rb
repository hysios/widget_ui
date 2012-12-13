module WidgetUI
  module EventHook
    extend ActiveSupport::Concern

    module ClassMethods
      # include ActiveSupport::Callbacks
      attr_accessor :events_callback
      events_callback = {}

      def bind(event, &block)
        events_callback[event] = block
        responds_to_event event, with: :events_process
      end

      def events_callback
        @events_callback ||= {}
      end
    end

    # def events_process(evt)
    #   event, callback = self.class.events_callback.find do |key, value| 
    #     evt.type == key
    #   end

    #   self.instance_exec &callback if callback.is_a? Proc
    # end
  end
end