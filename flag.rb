require "open-uri"
require "hpricot"
require "yaml"

module CUCBC
  class Flag
    def self.status
      @status ||= self.fetch
    end
    
    def self.changed?
      self.cached != self.status
    end
    
  private
  
    def self.cached
      @cached ||= YAML::load(File.open("flag.yml"))["status"].to_sym
    rescue
      nil
    end
  
    def self.fetch
      document = open("http://m.cucbc.org/"){ |f| Hpricot f }
      status = (document/"card#status/p/strong/").first.to_s.downcase.to_sym
      File.open("flag.yml", "w"){ |f| YAML.dump({"status" => status}, f) }
      status
    end
  end
end