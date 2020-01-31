module SpreeAvatar
  class Engine < ::Rails::Engine
    engine_name 'spree_avatar'

  	initializer "spree_avatar.assets.precompile" do |app|
#      app.config.assets.paths << File.expand_path("../../assets/images", __FILE__)
	    app.config.assets.precompile += %w( spree_avatar/*.svg )
    end

    config.to_prepare do
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

  end
end