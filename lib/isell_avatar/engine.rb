module IsellAvatar
  class Engine < ::Rails::Engine
    engine_name 'isell_avatar'

  	initializer "isell_avatar.assets.precompile" do |app|
#      app.config.assets.paths << File.expand_path("../../assets/images", __FILE__)
	    app.config.assets.precompile += %w( isell_avatar/*.svg )
#            'lib/assets/javascripts/spree/backend/spree_auth.css'
    end

    config.to_prepare do
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
#      Spree::Ability.register_ability(Spree::AvatarAbility)
    end

  end
end