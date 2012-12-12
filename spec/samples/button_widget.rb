class ButtonWidget < WidgetUI::UIBase
	responds_to_event :click

	def display
		render
	end

	def click
		puts 'click'
	end
end