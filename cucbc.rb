require "rubygems"
require "bundler/setup"

["flag", "notifier", "notifiers/screen", "notifiers/twitter"].each { |p| require File.expand_path(p) }

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