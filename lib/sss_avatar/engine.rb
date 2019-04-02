module SssAvatar
  class Engine < ::Rails::Engine
    engine_name 'sss_avatar'

  	initializer "sss_avatar.assets" do |app|
      app.config.assets.paths << Rails.root.join("app", "assets", "images", "sss_avatar")
	    app.config.assets.precompile += %w( sss_avatar/*.png sss_avatar/*.jpg )
    end

    config.to_prepare do
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
      Spree::Ability.register_ability(Spree::AvatarAbility)
    end

  end
end
