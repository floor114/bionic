# frozen_string_literal: true

require 'bionic/application/configuration'
require 'bionic/initializers/database'
require 'bionic/initializers/localization'
require 'bionic/initializers/bot'

module Bionic
  class Application
    include Singleton

    class << self
      delegate :config, to: :instance

      def inherited(base)
        super
        Bionic.app_class = base
      end
    end

    def run
      load_files!
      run_initializers!
      run_bot!
    end

    def run_bot!
      Bionic::Initializers::Bot.run
    end

    def run_initializers!
      config.initializers.each(&:run)
    end

    def load_files!
      config.autoload_files.each { |f| require f }
    end

    def config
      @config ||= Application::Configuration.new
    end
  end
end
