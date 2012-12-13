# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'widget_ui/version'

Gem::Specification.new do |gem|
  gem.name          = "widget_ui"
  gem.version       = WidgetUI::VERSION
  gem.authors       = ["hysios hu"]
  gem.email         = ["hysios@gmail.com"]
  gem.description   = %q{let widget work fun for ui}
  gem.summary       = %q{yeah}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "apotomo"
  gem.add_dependency "hooks", "~> 0.2.0"

  gem.add_development_dependency 'actionpack'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'apotomo'
  gem.add_development_dependency 'activesupport'
  gem.add_development_dependency 'debugger'
  gem.add_development_dependency "tzinfo"  
end
