require 'widget_ui/event_hook'

module WidgetUI
  class UIBase < Apotomo::Widget
    include WidgetUI::EventHook

  end
end