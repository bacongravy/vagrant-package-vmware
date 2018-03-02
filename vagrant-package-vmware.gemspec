
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vagrant-package-vmware/version"

Gem::Specification.new do |spec|
  spec.name          = "vagrant-package-vmware"
  spec.version       = VagrantPlugins::PackageVMware::VERSION
  spec.authors       = ["David Kramer"]
  spec.email         = ["bacongravy@icloud.com"]

  spec.summary       = %q{Enables Vagrant to package a running VMware environment into a box}
  spec.homepage      = "https://github.com/bacongravy/vagrant-package-vmware"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
end
