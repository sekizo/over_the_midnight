require "date"

class OverTheMidnight::Time
  DATE_FORMAT = "%Y/%m/%d"
  TIME_FORMAT = "%H:%M"
  
  attr_reader :date
  
  def initialize(date, time)
    super()
    @date = date
    @raw_time = time
  end
  
  def hour
    time.hour + ((time.to_date - date).to_i * 24)
  end
  
  def time
    @time ||= parse
  end
  
  def to_s
    date_format = date.strftime(DATE_FORMAT)
    format = [date_format, TIME_FORMAT].join(" ")
    format.gsub!(/\%H/, "#{hour}")
    time.strftime(format)
  end
  
  private
  
  def parse
    case @raw_time
    when String
      parse_string
    when Numeric
      parse_numeric
    when Time
      parse_time
    else
      raise "invalid time"
    end
  end
  
  def parse_string
    min = @raw_time.scan(/\:([0-9]+)\s*\z/).flatten.first.to_i

    h = @raw_time.scan(/\A\s*([0-9]+)/).flatten.first.to_i
    _date = @date + (h / 24)
    hour = h % 24
    
    Time.new(_date.year, _date.month, _date.day, hour, min)
  end
  
  def parse_numeric
    hour  = (@raw_time % 24)
    min   = ((@raw_time % 1.0) * 60)
    _date = @date + (@raw_time / 24)
    Time.new(_date.year, _date.month, _date.day, hour, min)
  end
  
  def parse_time
    @raw_time
  end
end
