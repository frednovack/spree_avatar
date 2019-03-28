require 'rails/generators'

module SssAvatar
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root SssAvatar::Engine.root.join('app', 'views', 'spree') #Needed by copy_views
    
      def copy_views
#        frontend_dirs = ['account']
#        frontend_dirs.each do |dir|
#          orig = dir
#          dest = './app/views/spree/' + dir
#          directory orig, dest, force: true
#        end
        copy_file 'account/users/show.html.erb', 'app/views/spree/account/users/show.html.erb'
      end  

    end
  end
end
