require './lib/kube/version'

Gem::Specification.new do |spec|
  spec.name         = 'kube'
  spec.version      = Kube::Version::Compact
  spec.summary      = Kube::Version::Summary
  spec.description  = Kube::Version::Description

  spec.platform     = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 2.2'

  spec.author       = 'Jurgen Jocubeit'
  spec.email        = 'jurgenjocubeit@gmail.com'
  spec.homepage     = 'https://github.com/JurgenJocubeit/kube'

  spec.rdoc_options.concat ['--encoding',  'UTF-8']

  spec.files        = `git ls-files`.split($/)
  spec.test_files   = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_path = 'lib'

  spec.add_runtime_dependency 'rails', '>= 4.2.6', '< 6.0.0'
end
