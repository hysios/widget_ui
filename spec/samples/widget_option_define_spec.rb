class PageWidget
	define_option :view_path, :set_view_path

	def set_view_path(path)
		@view_path = path
	end
end

class OptionDefineController < MockController::Base
  widgets_binding do
    create_page :content_page do 
      state :new, "page/new"
      view_path "widgets"

      create_button :new_content do 
        on_click do
          puts "alert('hi baby');"
          # render :js => "alert('hi baby');"
        end
      end

      create_search :search do 
      end
    end
  end
end

describe "option define test" do
	let(:controller) { OptionDefineController.new }
	let(:root) { controller.apotomo_root }
	let(:content_page) { root.find_widget(:content_page) }

	it "set view_path other path" do 
		content_page.instance_variable_get(:@view_path).should == "widgets"
	end
end