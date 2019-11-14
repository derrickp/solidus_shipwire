# frozen_string_literal: true

module SolidusShipwire
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def add_javascripts
        append_file 'app/assets/javascripts/store/all.js', "//= require store/solidus_shipwire\n"
        append_file 'app/assets/javascripts/admin/all.js', "//= require admin/solidus_shipwire\n"
      end

      def add_stylesheets
        inject_into_file 'app/assets/stylesheets/store/all.css', " *= require store/solidus_shipwire\n", before: %r{\*/}, verbose: true
        inject_into_file 'app/assets/stylesheets/admin/all.css', " *= require admin/solidus_shipwire\n", before: %r{\*/}, verbose: true
      end

      def add_migrations
        run 'bundle exec rake railties:install:migrations FROM=solidus_shipwire'
      end

      def run_migrations
        res = ask 'Would you like to run the migrations now? [Y/n]'
        if res == '' || res.casecmp('y').zero?
          run 'bundle exec rake db:migrate'
        else
          puts 'Skipping rake db:migrate, don\'t forget to run it!'
        end
      end
    end
  end
end
