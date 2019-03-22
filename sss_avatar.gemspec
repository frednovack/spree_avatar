$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "sss_avatar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "sss_avatar"
  spec.version     = SssAvatar::VERSION
  spec.summary     = "Avatar for Spree Social Sales."
  spec.description = "Adds an avatar to user account."

  spec.authors     = ["MateoLa"]
  spec.email       = ["mateo.laino@gmail.com"]
  spec.homepage    = "https://github.com/MateoLa"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 5.2.2"

  spec.add_dependency "spree_social_sales"
#  spec.add_development_dependency "sqlite3"
end
