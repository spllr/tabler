# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tabler/version"

Gem::Specification.new do |s|
  s.name        = "tabler"
  s.version     = Tabler::VERSION
  s.authors     = ["Klaas Speller"]
  s.email       = ["klaasspeller@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Create csv a hash}
  s.description = %q{Create csv data from a hash of an array of hashes}

  s.rubyforge_project = "tabler"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"

  # s.add_runtime_dependency "rest-client"
end
