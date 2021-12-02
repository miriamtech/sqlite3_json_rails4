require_relative 'lib/sqlite3_json_rails4/version'

Gem::Specification.new do |spec|
  spec.name        = 'sqlite3_json_rails4'
  spec.version     = Sqlite3JsonRails4::VERSION
  spec.authors     = ['Miriam Technologies']
  spec.email       = ['developers@miriamtech.com']
  spec.homepage    = 'https://www.miriamtech.com'
  spec.summary     = 'Support JSON columns in Rails 4 SQLite adapter'
  spec.description = <<~EOF
    The SQLite3 adapter in Rails 4 doesn't support JSON columns. This gem adds
    it via a railtie and a series of hacks.
  EOF

  spec.license = 'MIT'
  spec.required_ruby_version = '~> 2.5'
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files = Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'activerecord', '~> 4.2'
  spec.add_dependency 'railties', '~> 4.2'
  spec.add_dependency 'sqlite3', '~> 1.3.13'
  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'ci_reporter_minitest', '~> 1.0'
  spec.add_development_dependency 'debase', '~> 0.2'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.23'
  spec.add_development_dependency 'rubocop-minitest', '~> 0.17'
  spec.add_development_dependency 'ruby-debug-ide', '~> 0.7'
end
