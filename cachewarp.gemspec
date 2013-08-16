# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cachewarp/version'

Gem::Specification.new do |spec|
  spec.name          = "cachewarp"
  spec.version       = GEM_VERSION
  spec.authors       = ["codeweft", "bitweft", "juteroot"]
  spec.email         = ["juteroot@gmail.com"]
  spec.description   = %q{Verify cache and content delivery headers}
  spec.summary       = %q{Ruby Gem targeted towards providing a solution to verify cache headers for content delivery services like Akamai}
  spec.homepage      = "http://www.juteroot.com"
  spec.license       = "To be decided"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest-given"
end
