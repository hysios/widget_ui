require File.expand_path("../../spec_helper", __FILE__)
require File.expand_path("../button_widget", __FILE__)
require File.expand_path('../controller', __FILE__)

describe "SampleController" do
  let(:controller) { SampleController.new }
  let(:root) { controller.apotomo_root }

  it "widgets_binding_tree" do 
    controller.apotomo_root.should_not be_nil
    root.children[0].name.should == :button
    root.children[1].name.should == :new_content
  end


  it "trigget click event" do
    controller.trigger(:click, :new_content)
  end
end