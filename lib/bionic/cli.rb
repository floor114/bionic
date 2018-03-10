# frozen_string_literal: true

require 'thor'
require 'bionic/cli/new'
require 'bionic/cli/start'

module Bionic
  class CLI < Thor
    register(Bionic::Cli::New, 'new', 'new NAME', 'Generates new project.')
    register(Bionic::Cli::Start, 'start', 'start', 'Start project.')
  end
end
