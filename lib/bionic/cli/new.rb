# frozen_string_literal: true

module Bionic
  class Cli
    class New < Thor::Group
      include Thor::Actions

      argument :name, required: true

      def self.source_root
        File.expand_path('template', __dir__)
      end

      def create_app_folders
        create_file "#{name}/app/handlers/.keep"
        create_file "#{name}/app/models/.keep"
        create_file "#{name}/app/services/.keep"
      end

      def create_bin
        copy_file 'bin/run', "#{name}/bin/run"
      end

      def create_locales
        copy_file 'config/locales/en.yml', "#{name}/config/locales/en.yml"
      end

      def create_application
        app_name = name.split('_').map(&:capitalize).join
        create_file "#{name}/config/application.rb" do
          <<~TXT
            # frozen_string_literal: true

            require_relative 'boot'
            require 'bionic'
            Bundler.require(*Bionic.groups)

            class #{app_name} < Bionic::Application
            end
          TXT
        end
      end

      def create_configs
        copy_file 'config/boot.rb', "#{name}/config/boot.rb"
        copy_file 'config/database.yml', "#{name}/config/database.yml"
      end

      def create_db_folders
        create_file "#{name}/db/migrate/.keep"
      end

      def create_log_folder
        create_file "#{name}/log/.keep"
      end

      def create_env
        copy_file '.env', "#{name}/.env"
      end

      def migrations_config
        copy_file '.standalone_migrations', "#{name}/.standalone_migrations"
      end

      def gemfile
        copy_file 'Gemfile', "#{name}/Gemfile"
      end

      def rakefile
        copy_file 'Rakefile', "#{name}/Rakefile"
      end

      def readme
        copy_file 'README.md', "#{name}/README.md"
      end
    end
  end
end
