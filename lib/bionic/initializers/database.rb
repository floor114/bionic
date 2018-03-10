# frozen_string_literal: true

require 'active_record'

module Bionic
  module Initializers
    class Database
      def self.run
        ActiveRecord::Base.logger = Logger.new(Bionic.application.config.log_files[:database])
        ActiveRecord::Base.establish_connection(Bionic.application.config.database[Bionic.env])
      end
    end
  end
end
