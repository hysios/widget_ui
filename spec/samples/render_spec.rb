require File.expand_path("../../spec_helper", __FILE__)

describe "Controller render" do
  let(:controller) { SampleController.new }
  let(:root) { controller.apotomo_root }
  let(:button)	{ root.find_widget(:new_content) }
  let(:page) { root.find_widget(:page) }

  it "render button display" do
  	button.invoke(:display, 'create').should == "<button value='create' ></button>"
  end

  it "render another widget state" do
  	button.invoke(:goto_page).should == "I'am a Page"
  end
end