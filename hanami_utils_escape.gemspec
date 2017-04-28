# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hanami_utils_escape/version'

Gem::Specification.new do |spec|
  spec.name          = "hanami_utils_escape"
  spec.version       = HanamiUtilsEscape::VERSION
  spec.authors       = ["Luca Guidi"]
  spec.email         = ["me@lucaguidi.com"]

  spec.summary       = "Hanami::Utils Escape"
  spec.description   = "Porting of Hanami::Utils Escape with Helix/Rust"
  spec.homepage      = "https://lucaguidi.com"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.add_dependency "helix_runtime", "~> 0.5.0"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake",    "~> 10.0"
  spec.add_development_dependency "rspec",   "~> 3.5"
end
