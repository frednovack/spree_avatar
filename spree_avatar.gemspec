$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "spree_avatar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.platform    = Gem::Platform::RUBY  
  spec.name        = "spree_avatar"
  spec.version     = SpreeAvatar::VERSION
  spec.summary     = "Spree Avatar"
  spec.description = "Adds an avatar to the user account."

  spec.authors     = ["MateoLa"]
  spec.email       = ["mateo.laino@gmail.com"]
  spec.homepage    = "https://github.com/MateoLa"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "http://github.com/MateoLa/spree_avatar"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.2", ">= 6.0.2.1"
  spec.add_dependency "spree_core", "~> 4.0"
  spec.add_dependency "active_storage_validations"
  
end
