Gem::Specification.new do |s|
  s.name = "swot-ruby"
  s.version = "1.0.5.20240415"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dave Kimura", "Lee Reilly"]
  s.date = "2023-06-10"
  s.description = "Identify email addresses or domains names that belong to colleges or universities. Help automate the process of approving or rejecting academic discounts."
  s.email = "dave@k-innovations.net"
  s.files = `git ls-files -z`.split("\x0") + Dir['data/lib/domains/*']

  s.homepage = "https://github.com/kobaltz/swot"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new(">= 2.0")
  s.rubygems_version = "2.0.14"
  s.summary = "Identify email addresses or domains names that belong to colleges or universities."
  s.test_files = ["test/helper.rb", "test/test_collection_methods.rb", "test/test_swot.rb"]

  s.add_dependency('naughty_or_nice', "~> 2.0")
  s.add_dependency('public_suffix', ">= 0")
end

