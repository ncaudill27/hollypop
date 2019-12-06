lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hollypop/version"

Gem::Specification.new do |spec|
  spec.name          = "hollypop"
  spec.version       = HollyPop::VERSION
  spec.authors       = ["ncaudill27"]
  spec.email         = ["nelson.a.caudill@gmail.com"]

  spec.summary       = %q{HollyPop! The celebrity quiz game!}
  spec.description   = %q{HollyPop is a Flatiron student CLI project.}
  spec.homepage      = "https://github.com/ncaudill27/hollypop"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  spec.add_dependency "tty-prompt"
  spec.add_dependency "paint"
end
