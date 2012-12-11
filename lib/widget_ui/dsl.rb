module WidgetUI
  module DSL
  end
end

dsl_path = File.expand_path('../dsl/', __FILE__)
require dsl_path + 'builder'
require dsl_path + 'controls'