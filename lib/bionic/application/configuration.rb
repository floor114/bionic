# frozen_string_literal: true

require 'yaml'
require 'erb'

module Bionic
  class Application
    class Configuration
      attr_accessor :initializers, :config_files, :log_files, :locale, :autoload_files, :root

      def initialize
        @initializers = [Bionic::Initializers::Database, Bionic::Initializers::Localization]
        @root = Pathname.new(Dir.pwd)
        @autoload_files = [
          root.join('app/handlers/**/*.rb'),
          root.join('app/models/**/*.rb'),
          root.join('app/services/**/*.rb')
        ].flat_map { |dir| Dir[dir].sort }
        @config_files = { database: 'config/database.yml', i18n: Dir['config/locales/*.yml'] }
        @log_files = { database: 'log/database.log' }
        @locale = :en
      end

      def database
        @database ||= begin
          file = Pathname.new(config_files[:database]) if config_files[:database]
          raise "Could not load database configuration. No such file #{config_files[:database]}" unless file&.exist?

          YAML.load(ERB.new(file.read).result) || {} # rubocop:disable Security/YAMLLoad
        end
      end
    end
  end
end
