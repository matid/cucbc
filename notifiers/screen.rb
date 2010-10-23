module CUCBC
  module Notifier
    class Screen < Base
      def self.update(message)
        puts message
      end
    end
  end
end