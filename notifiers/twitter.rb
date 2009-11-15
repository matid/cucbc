require "twitter"

module CUCBC
  module Notifier
    class Twitter < Base
      def self.connect
        config = YAML::load(File.open("twitter.yml"))
        
        auth = ::Twitter::HTTPAuth.new(config["username"], config["password"])
        
        @client = ::Twitter::Base.new(auth)
      end
      
      def self.update(message)
        connect
        @client.update(message)
      end
    end
  end
end