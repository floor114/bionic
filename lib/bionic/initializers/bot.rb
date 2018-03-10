# frozen_string_literal: true

require 'telegram/bot'
require 'bionic/handle'

module Bionic
  module Initializers
    class Bot
      def self.run
        Bionic.logger.info('Running bot...')
        Telegram::Bot::Client.run(ENV['BOT_TOKEN']) do |bot|
          bot.listen do |message|
            Bionic.logger.info("Received `#{message.text}` from @#{message.from.username}.")
            Bionic::Handle.call(message, bot)
          end
        end
      end
    end
  end
end
