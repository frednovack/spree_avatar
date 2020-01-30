require 'rails/generators'

module SpreeAvatar
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      def add_assets_to_spree
        # "Injecting into File" avoids the need to override layouts
        # adding scripts or stylesheets tags lines.
        inject_into_file 'vendor/assets/javascripts/spree/frontend/all.js', "\n//= require spree_avatar/frontend\n", after: "spree/frontend", verbose: true
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', "\n *= require spree_avatar/frontend\n", after: "spree/frontend", verbose: true
      end

#      source_root SssAvatar::Engine.root.join('app', 'views', 'spree') #Needed by copy_views
    
#      def copy_views
#        frontend_dirs = ['account']
#        frontend_dirs.each do |dir|
#          orig = dir
#          dest = './app/views/spree/' + dir
#          directory orig, dest, force: true
#        end
#        copy_file 'account/users/show.html.erb', 'app/views/spree/account/users/show.html.erb'
#      end  

    end
  end
end
