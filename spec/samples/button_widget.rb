class ButtonWidget < WidgetUI::UIBase
	responds_to_event :click

	def display(title)
		@title = title
		render
	end

	def click
		puts 'click'
	end

	def goto_page
		render :widget => :page, :state => :display
	end
end