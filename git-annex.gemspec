Gem::Specification.new do |s|
  s.authors = ['Stephen Paul Weber']
  s.date = '2016-12-03'
  s.email = 'singpolyma@singpolyma.net'
  s.homepage = 'https://github.com/usetint/ruby-git-annex'
  s.license = 'ISC'
  s.name = 'git-annex'
  s.summary = 'Additions to Ruby/Git to enable calls to the git-annex binary.'
  s.version = '0.0.1'

  s.require_paths = ['lib']
  s.required_ruby_version = '>= 1.9'
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.requirements = ['git-annex']

  s.add_dependency 'git'

  s.rdoc_options = ['--charset=UTF-8']

  s.files = [
    'COPYING',
    'VERSION',
    'lib/**'
  ]
end
