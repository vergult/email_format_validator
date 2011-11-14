# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "email_format_validator"
  s.version     = "1.0.3"
  s.authors     = ["Axel Vergult"]
  s.email       = ["axel.vergult@gmail.com"]
  s.homepage    = "https://github.com/episko/email_format_validator"
  s.summary     = %q{A Rails 3 email format validator with RFC 822 compliant option}
  s.description = %q{A Rails 3 email format validator with RFC 822 compliant option}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency("activemodel", ">= 0")
end
