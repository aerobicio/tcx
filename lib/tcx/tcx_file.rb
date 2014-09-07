require "ox"

module Tcx
  class TcxFile
    def initialize(tcx_data)
      io = StringIO.new(tcx_data)
      @handler = TcxParser.new
      Ox.sax_parse(@handler, io)
    end

    # In milliseconds to provide the same interface as FIT.
    def active_duration
      total_time_in_seconds * 1000
    end

    # In cm to provide the same interface as FIT.
    def distance
      total_distance_in_meters * 100
    end

    def start_time
      @start_time ||= Time.parse(@handler.laps.first.start_time)
    end

    def end_time
      start_time + total_time_in_seconds
    end

    def sport
      @handler.sport
    end

    private

    def total_time_in_seconds
      @total_time_in_seconds ||= @handler.laps.inject(0) { |k,v| k + v.total_time_seconds }
    end

    def total_distance_in_meters
      @total_distance_in_meters ||= @handler.laps.inject(0) { |k,v| k + v.distance_meters }
    end
  end

  class TcxParser < ::Ox::Sax
    class Lap
      attr_accessor :start_time, :total_time_seconds, :distance_meters
    end

    attr_reader :laps
    attr_reader :sport

    def initialize
      @laps = []
    end

    def start_element(name)
      case name
      when :Activity
        @activity = true
      when :Lap
        @lap = Lap.new
      when :TotalTimeSeconds
        @total_time_seconds = true
      when :DistanceMeters
        @distance_meters = true
      end
    end

    def end_element(name)
      case name
      when :Lap
        @laps << @lap
        @lap = nil
      when :TotalTimeSeconds
        @total_time_seconds = false
      when :DistanceMeters
        @distance_meters = false
      end
    end

    def attr(name, value)
      if @activity
        case name
        when :Sport
          @sport = value.upcase
          @activity = nil
        end
      elsif @lap
        case name
        when :StartTime
          @lap.start_time = value
        end
      end
    end

    def text(value)
      if @lap
        if @total_time_seconds
          @lap.total_time_seconds = BigDecimal.new(value)
        elsif @distance_meters
          @lap.distance_meters = BigDecimal.new(value)
        end
      end
    end
  end
end
