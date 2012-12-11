module WidgetUI
	class Builder

    def initialize(&block)
      @block = block
    end

    def dispatch
      self.instance_exec(&@block)
    end
	end
end