require File.expand_path("../../spec_helper", __FILE__)

class SampleController < MockController::Base
  widgets_binding do
    create_page :page do 
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
describe "SampleController" do

  let(:controller) { SampleController.new } 
  let(:root) { controller.apotomo_root }


  it "widgets_binding_tree" do 
    controller.widget_builder
    controller.apotomo_root.should_not be_nil
    root.children[0].name.should == :page
    page = root.children[0]
    page.children[0].name.should == :new_content
    page.children[1].name.should == :search
#    root.children[1].name.should == :new_content
  end


  it "trigget click event" do
    controller.trigger(:click, :new_content)
  end
end