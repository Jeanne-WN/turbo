# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'turbo/version'

Gem::Specification.new do |gem|
  gem.name        = "turbogenerator"
  gem.version     = Turbo::VERSION
  gem.date        = "2015-03-12"
  gem.summary     = "Turbo is a HTTP API tester"
  gem.description = "Turbo is a HTTP API tester, it's a curl wrapper"
  gem.authors     = ["Juntao Qiu", "Jia Wei", "Shen Tong", "Yan Yu", "Yang Mengmeng"]
  gem.email       = "juntao.qiu@gmail.com"
  gem.homepage    = "https://github.com/abruzzi/turbo"
  gem.license     = "MIT"

  gem.files       = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files  = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'thor'
  gem.add_runtime_dependency 'term-ansicolor', '~> 1.3', '>= 1.3.0'

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rake'
end
