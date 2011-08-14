require "open-uri"
require "hpricot"
require "active_support/core_ext"

module CUCBC
  class Flag
    def initialize
      @status = fetch or raise "Could not initialise Flag status from CUCBC"
    end
    
    def status
      @status = fetch || @status
    end
    
    def changed?
      cached != status
    end
    
  private
  
    def cached
      @status
    end
  
    def fetch
      document = open("http://m.cucbc.org/"){ |f| Hpricot f }
      (document/"card#status/p/strong/").first.to_s.downcase.presence
    rescue StandardError
    end
  end
end