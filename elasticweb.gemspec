lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elasticweb/version'

Gem::Specification.new do |spec|
  spec.name          = 'elasticweb'
  spec.version       = ElasticWeb::VERSION
  spec.authors       = ['Vitaly Lazorka']
  spec.email         = ['dev1.vitaly@gmail.com']

  spec.summary       = %q{Client library for Elasticweb API.}
  spec.description   = %q{Client library for Elasticweb API.}
  spec.homepage      = 'https://github.com/dev1vitaly/elasticweb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.3.0'

  spec.add_dependency 'httparty'
  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
end
