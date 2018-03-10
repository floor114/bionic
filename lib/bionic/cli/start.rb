# frozen_string_literal: true

module Bionic
  class Cli
    class Start < Thor::Group
      include Thor::Actions

      def start
        app_file = Pathname.new("#{Dir.pwd}/config/application.rb")

        raise "Application file 'config/application.rb' was not found" unless app_file.exist?

        require app_file
        raise 'Application class was not found' unless Bionic.application

        Bionic.run
      end
    end
  end
end
