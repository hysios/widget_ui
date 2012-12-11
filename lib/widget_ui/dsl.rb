module WidgetUI
  module DSL
  end
end

dsl_path = File.dirname __FILE__
require File.join dsl_path, 'dsl/builder'
require File.join dsl_path, 'dsl/controls'