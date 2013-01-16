# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "has_money_fields/version"

Gem::Specification.new do |s|
  s.name        = "has_money_fields"
  s.version     = HasMoneyFields::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Francisco J. Casas"]
  s.email       = ["fran@zorros.be"]
  s.homepage    = "http://zorros.be"
  s.summary     = %q{Persist your money on a clean and easy way with Money gem}
  s.description = <<-DESC
Use the Money gem and ActiveRecord's composed_of to store fields wich contains
currency data in a safe and clean way.
  DESC

  s.rubyforge_project = "has_money_fields"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "activerecord", ">= 3.0"
  s.add_dependency "money"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec", "~> 2"
  s.add_development_dependency "rake"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-rspec"
end
