module CUCBC
  module Notifier
    class Screen < Base
      def self.update(message)
        puts message
        STDOUT.flush
      end
    end
  end
end