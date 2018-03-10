# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bionic/version'

Gem::Specification.new do |spec|
  spec.name          = 'bionic'
  spec.version       = Bionic::VERSION
  spec.authors       = ['Taras Shpachenko']
  spec.email         = ['taras.shpachenko@gmail.com']

  spec.summary       = 'Telegram bots framework.'
  spec.description   = 'Framework for creating telegram bots.'
  spec.homepage      = 'https://github.com/floor114/bionic'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'activerecord', '~> 5.1'
  spec.add_runtime_dependency 'dotenv', '~> 2.2'
  spec.add_runtime_dependency 'i18n', '~> 0.7'
  spec.add_runtime_dependency 'standalone_migrations', '~> 5.2'
  spec.add_runtime_dependency 'telegram-bot-ruby', '~> 0.8.6'
  spec.add_runtime_dependency 'thor', '~> 0.20'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.53'
end
