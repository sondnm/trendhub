
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "trendhub/version"

Gem::Specification.new do |spec|
  spec.name = "trendhub"
  spec.version = Trendhub::VERSION
  spec.authors = ["Son Dang"]
  spec.email = ["sondangdev@gmail.com"]

  spec.summary = %q{View github trending repositories  from your terminal.}
  spec.description = %q{View github trending repositories from your terminal.}
  spec.homepage = "https://github.com/sondnm/trendhub"
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/sondnm/trendhub"
    spec.metadata["changelog_uri"] = "https://github.com/sondnm/trendhub/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.glob("{bin,lib,data}/**/*") + %w(LICENSE README.md)
  spec.bindir = "bin"
  spec.executables = ["trendhub"]
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.20"
  spec.add_dependency "http", "~> 4.0"
  spec.add_dependency "oga", "~> 2.2"

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "pry", "~> 0.12"
end
