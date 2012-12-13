require File.expand_path("../../spec_helper", __FILE__)

describe "Option Methods" do 
	let(:controller) { SampleController.new }
	let(:root) { controller.apotomo_root }

	let(:button)	{ root.find_widget(:new_content) }
	let(:page) { root.find_widget(:page) }

	it "page have state?" do
		page.send(:status).should include({:name => :new, :path=>"page/new" })
	end

	it "page display can display correct view" do 
		puts page.invoke(:display, :new)
	end
end