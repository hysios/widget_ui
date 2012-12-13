require 'widget_ui/event_hook'

module WidgetUI
  class UIBase < Apotomo::Widget
    include WidgetUI::EventHook

    def events_process(evt)
      event, callback = self.class.events_callback.find do |key, value| 
        evt.type == key
      end

      self.instance_exec &callback if callback.is_a? Proc
    end
  end
end