# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'to_php_array/version'

Gem::Specification.new do |spec|
  spec.name          = "to_php_array"
  spec.version       = ToPhpArray::VERSION
  spec.authors       = ["tsmsogn"]
  spec.email         = ["tsmsogn@gmail.com"]

  spec.summary       = %q{Dump PHP Array from Ruby's Hash or Array.}
  spec.description   = %q{Dump PHP Array from Ruby's Hash or Array.}
  spec.homepage      = "https://github.com/tsmsogn/to_php_array"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
