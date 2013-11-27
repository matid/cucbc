module CUCBC
  module Notifier
    class Twitter < Base
      def self.connect
        @client = ::Twitter::REST::Client.new do |config|
          config.consumer_key = ENV["CONSUMER_TOKEN"]
          config.consumer_secret = ENV["CONSUMER_SECRET"]
          config.access_token = ENV["OAUTH_TOKEN"]
          config.access_token_secret = ENV["OAUTH_TOKEN_SECRET"]
        end
      end

      def self.update(message)
        connect
        @client.update(message)
      end
    end
  end
end