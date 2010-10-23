module CUCBC
  module Notifier
    class Twitter < Base
      def self.connect
        config = YAML::load(File.open("twitter.yml"))

        oauth = ::Twitter::OAuth.new(config["consumer_token"], config["consumer_secret"])
        oauth.authorize_from_access(config["oauth_token"], config["oauth_token_secret"])

        @client = ::Twitter::Base.new(oauth)
      end

      def self.update(message)
        connect
        @client.update(message)
      end
    end
  end
end