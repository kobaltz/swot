# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = "swot"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Lee Reilly"]
  s.date = "2015-07-10"
  s.description = "Identify email addresses or domains names that belong to colleges or universities. Help automate the process of approving or rejecting academic discounts."
  s.email = "lee@leereilly.net"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    "CONTRIBUTING.md",
    "Gemfile",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/swot.rb",
    "lib/swot/academic_tlds.rb",
    "lib/swot/collection_methods.rb",
    "swot.gemspec",
    "test/helper.rb",
    "test/test_collection_methods.rb",
    "test/test_swot.rb"
  ]
  s.files << `git ls-files -z`.split("\x0") + Dir['data/lib/domains/*']

  Dir.glob('lib/domains/**/*.txt').each do |path|
    s.files << path if File.file?(path)
  end

  s.homepage = "https://github.com/kobaltz/swot"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0")
  s.rubygems_version = "2.0.14"
  s.summary = "Identify email addresses or domains names that belong to colleges or universities."
  s.test_files = ["test/helper.rb", "test/test_collection_methods.rb", "test/test_swot.rb"]

  s.add_dependency('public_suffix', ">= 0")
  s.add_dependency('naughty_or_nice', "~> 2.0")
end

