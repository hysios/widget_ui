module WidgetUI
  module EventHook
    extend ActiveSupport::Concern


    module ClassMethods
      # include ActiveSupport::Callbacks

      def bind(event, &block)
        events_callback event, &block
        responds_to_event event, with: :events_process
      end

      protected
        @@events_callback = {}
        def events_callback(name, &block)
          @@events_callback[name] = block
        end
    end

    def events_process(evt)
      debugger
      # events_callback.
    end

    protected
      def events_callback
        @@events_callback
      end
  end
end