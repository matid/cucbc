require "flag"
require "notifier"
require "notifiers/twitter"

module CUCBC
  class Base
    attr_accessor :notifiers, :flag
    
    def initialize
      notifiers = [Notifier::Twitter]
      if Flag.changed?
        notifiers.each do |notifier|
          notifier.update("The flag is #{Flag.status}.")
        end
      end
    end
  end
end

CUCBC::Base.new