require_relative 'lib/html/proofer/unrendered/markdown/version'

Gem::Specification.new do |spec|
  spec.name          = "html-proofer-unrendered-markdown"
  spec.version       = Html::Proofer::Unrendered::Markdown::VERSION
  spec.authors       = ["Daniel Granerud"]
  spec.email         = ["daniel.granerud@payex.com"]

  spec.summary       = "Adds extra validation to rendered markdown"
  spec.homepage      = "https://github.com/SwedbankPay/html-proofer-unrendered-markdown"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", "~> 12.3.1"
  spec.add_runtime_dependency 'html-proofer', '~> 3.0', '>= 3.15.1'
  spec.add_development_dependency 'rspec', '~> 3.5', '>= 3.5.0'
end
