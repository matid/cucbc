require "open-uri"
require "hpricot"

module CUCBC
  class Flag
    def self.status
      self.fetch
    end
    
    def self.changed?
      self.cached != self.status
    end
    
  private
  
    def self.cached
      @cached || self.status
    end
  
    def self.fetch
      document = open("http://m.cucbc.org/"){ |f| Hpricot f }
      @cached = (document/"card#status/p/strong/").first.to_s.downcase.to_sym
    end
  end
end