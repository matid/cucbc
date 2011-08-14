require "bundler/setup"

["flag", "notifier", "notifiers/screen", "notifiers/twitter"].each { |p| require File.expand_path(p) }

module CUCBC
  class Base
    attr_accessor :notifiers, :flag

    def initialize
      self.notifiers = [Notifier::Screen, Notifier::Twitter]
      self.flag = Flag.new
    end
    
    def loop
      if flag.changed?
        notifiers.each do |notifier|
          notifier.update("The flag is #{flag.status}.")
        end
      end
    end
  end
end

cucbc = CUCBC::Base.new

loop do
  cucbc.loop
  sleep 5 * 60
end