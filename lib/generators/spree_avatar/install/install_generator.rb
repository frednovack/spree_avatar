module SpreeAvatar
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      class_option :migrate, type: :boolean, default: false

      def add_assets_to_spree
        # "Injecting into File" avoids the need to override layouts adding scripts or stylesheets tags.
        inject_into_file 'vendor/assets/javascripts/spree/frontend/all.js', "\n//= require spree_avatar/frontend\n", after: "spree/frontend", verbose: true
        inject_into_file 'vendor/assets/stylesheets/spree/frontend/all.css', "\n *= require spree_avatar/frontend\n", after: "spree/frontend", verbose: true
      end

      def add_migrations
        run 'rake railties:install:migrations FROM=spree_avatar'
      end

      def run_migrations
        run_migrations = options[:migrate] || ['', 'y', 'Y'].include?(ask 'Would you like to run migrations now? [Y/n]')
        if run_migrations
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end

    end
  end
end
