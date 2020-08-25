module SpreeAvatar
  module Generators
    class InstallGenerator < Rails::Generators::Base

      def add_assets_to_spree
        # "Injecting to File" avoids the need to override layouts
        # adding scripts or stylesheets tag lines.
        inject_into_file 'vendor/assets/javascripts/spree/frontend/all.js', "\n//= require spree_avatar/frontend", after: "spree/frontend", verbose: true
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', "\n *= require spree_avatar/frontend", after: "spree/frontend", verbose: true
      end

#      def copy_views
#        dirs_to_copy = ['avatars', 'users']
#        dirs_to_copy.each do |dir|
#          orig = 'views/spree/' + dir
#          dest = './app/views/spree/' + dir
#          directory orig, dest, force: true
#        end
#      end

    end
  end
end
