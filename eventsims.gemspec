# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eventsims/version'

Gem::Specification.new do |spec|
  spec.name          = "eventsims"
  spec.version       = Eventsims::VERSION
  spec.authors       = ["Taiwo Kareem"]
  spec.email         = ["taiwo.kareem36@gmail.com"]

  spec.summary       = %q{Eventsims uses various useful tools in simulating discrete system events based on outcome and probabilities}
  spec.description   = %q{Eventsims is a Ruby package for simulating discrete event. It has  four classes (Calculate, Generate, Randomsim and Simulate) and two methods(trimval and trimlist) for making this possible. }
  spec.homepage      = "http://github.com/tushortz/eventsims"
  spec.license       = "MIT"

  # # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  # spec.add_development_dependency "rspec"
  # spec.add_development_dependency "guard"
  # spec.add_development_dependency "guard-rspec"
  # spec.add_development_dependency "coveralls"
end
