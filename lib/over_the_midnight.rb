require "over_the_midnight/version"

module OverTheMidnight
  LIB = File.expand_path(File.dirname(__FILE__))
  ROOT = File.dirname(OverTheMidnight::LIB)
  
  def self.create(*args)
    self::Time.new(*args)
  end
end

$:<< OverTheMidnight::LIB
Dir.glob(File.join(OverTheMidnight::LIB, "**/*.rb")).each do |entory|
  require entory
end
