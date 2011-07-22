require "bundler/setup"

["flag", "notifier", "notifiers/screen", "notifiers/twitter"].each { |p| require File.expand_path(p) }

module CUCBC
  class Base
    attr_accessor :notifiers, :flag

    def initialize
      notifiers = [Notifier::Screen, Notifier::Twitter]
      if Flag.changed?
        notifiers.each do |notifier|
          notifier.update("The flag is #{Flag.status}.")
        end
      end
    end
  end
end

loop do
  CUCBC::Base.new
  sleep 5 * 60
end