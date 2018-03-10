# frozen_string_literal: true

module Bionic
  class Handle
    COMMAND_REGEX = %r(\A/([a-z\d_]{,31})(@(\S+))?(\s|$))

    class << self
      def call(*args)
        new(*args).call
      end
    end

    def initialize(message, bot)
      @message = message
      @bot = bot
      @command, @args = parse_message
    end

    def call
      return if message.text.blank? || command.blank?

      handler_class_name.constantize.call(message, bot, args)
    rescue NameError => e
      Bionic.logger.error("Unknown handler: #{handler_class_name} (#{e.message})")
    end

    private

    attr_reader :message, :bot, :command, :args

    def handler_class_name
      @handler_class_name ||= "Handlers::#{command.split('_').map(&:capitalize).join}"
    end

    def parse_message
      return if message.text.blank?
      base_part, command, _, mention = message.text.match(COMMAND_REGEX).to_a

      return if base_part.blank?
      return if mention && ENV['BOT_USERNAME'] && mention != ENV['BOT_USERNAME']

      [command, message.text.gsub(base_part, '').split(',').map(&:strip)]
    end
  end
end
