# frozen_string_literal: true

require 'i18n'

module Bionic
  module Initializers
    class Localization
      def self.run
        I18n.load_path = Bionic.application.config.config_files[:i18n]
        I18n.locale = Bionic.application.config.locale
        I18n.backend.load_translations
      end
    end
  end
end
