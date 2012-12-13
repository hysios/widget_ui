require 'widget_ui/event_hook'
require 'widget_ui/option_methods'

module WidgetUI
  class UIBase < Apotomo::Widget
    include WidgetUI::EventHook
    include WidgetUI::OptionMethods


    private 
    def render_view_for(state, *args)
      opts = args.first.is_a?(::Hash) ? args.shift : {}
    
      if opts[:widget]
        # if opts[:state] || opts[:view]
        widget_id = opts.delete(:widget)
        widget = root.find_widget(widget_id)
        if widget
          widget.action_name = state
          widget.render(opts)
        else
          raise "not found named #{widget_id}'s Widget"
        end
      else
        args.unshift opts
        super
      end
    end
  end
end