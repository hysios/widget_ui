require File.expand_path("../../spec_helper", __FILE__)

class OtherSampleController < MockController::Base
  widgets_binding do
    create_page :content_page do 
      state :new, "page/new"

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

describe "OtherSampleController" do

  let(:controller) { OtherSampleController.new } 
  let(:root) { controller.apotomo_root }

  it "widgets_binding_tree" do
    controller.apotomo_root.should_not be_nil
    root.children[0].name.should == :content_page
    page = root.children[0]
    page.children[0].name.should == :new_content
    page.children[1].name.should == :search
#    root.children[1].name.should == :new_content
  end

end