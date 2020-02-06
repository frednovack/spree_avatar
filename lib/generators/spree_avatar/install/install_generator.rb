module SpreeAvatar
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_assets_to_spree
        # "Injecting into File" avoids the need to override layouts adding scripts or stylesheets tags.
        inject_into_file 'vendor/assets/javascripts/spree/frontend/all.js', "\n//= require spree_avatar/frontend\n", after: "spree/frontend", verbose: true
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', "\n *= require spree_avatar/frontend\n", after: "spree/frontend", verbose: true
      end

    end
  end
end
