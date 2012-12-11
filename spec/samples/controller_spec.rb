require File.expand_path("../button_widget", __FILE__)
require File.expand_path("../../spec_helper", __FILE__)


describe "SampleController" do
  before :each do 
    SampleController.send(:include, WidgetUI::ControllerMethods)
  end 

  it "widgets_binding" do 
    SampleController.widgets_binding do
      create_button :new_content do 
        on_click do
          render :js => "alert('hi baby');"
        end
      end
    end   
  end

end