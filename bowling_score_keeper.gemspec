# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "bowling_score_keeper/version"

Gem::Specification.new do |spec|
  spec.name          = "bowling_score_keeper"
  spec.version       = VERSION
  spec.authors       = ["Mugur (Bud) Chirica"]
  spec.email         = ["chirica.mugurel@gmail.com"]

  spec.summary       = %q{Basic implementation of a bowling game score keeper in Ruby.}

  spec.description   = %q{Basic implementation of a bowling game score keeper in Ruby }
  spec.homepage      = "https://github.com/budmc29/bowling_game"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = ["bowling_score_keeper", "bsk"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry", "~> 0.10"
  spec.add_development_dependency "pry-byebug", "~> 3.4.2"
end
