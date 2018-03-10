# frozen_string_literal: true

require 'bionic/version'
require 'bionic/environment'
require 'bionic/application'
require 'bionic/handler'
require 'dotenv/load'
require 'thor'

module Bionic
  class << self
    @application = @app_class = nil

    attr_accessor :app_class

    def application
      @application ||= app_class&.instance
    end

    def root
      application&.config&.root
    end

    delegate :run, to: :application

    def env
      @env ||= Environment.new(ENV['RACK_ENV'])
    end

    def logger
      @logger ||= Logger.new(STDOUT, Logger::DEBUG)
    end

    def groups
      ['default', Bionic.env]
    end
  end
end
