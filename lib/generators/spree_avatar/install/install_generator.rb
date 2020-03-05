module SpreeAvatar
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_assets_to_spree
        # "Injecting to File" avoids the need to override layouts
        # adding scripts or stylesheets tags lines.
        inject_into_file 'vendor/assets/javascripts/spree/frontend/all.js', "\n//= require spree_avatar/frontend", after: "spree/frontend", verbose: true
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', "\n *= require spree_avatar/frontend", after: "spree/frontend", verbose: true
        inject_into_file 'vendor/assets/stylesheets/spree/backend/all.css', "\n *= require spree_avatar/backend", after: "spree/backend", verbose: true
      end

    end
  end
end
