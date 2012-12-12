require File.expand_path("../../spec_helper", __FILE__)
require File.expand_path("../button_widget", __FILE__)
require File.expand_path('../controller', __FILE__)

describe "SampleController" do
  let(:controller) { SampleController.new }

  it "widgets_binding" do 
    controller.apotomo_root.should_not be_nil    
  end


  it "trigget click event" do
    controller.trigger(:click, :new_content)
  end
end