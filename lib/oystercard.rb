require_relative 'station'

class Oystercard
    LIMIT = 90
    MINIMUM = 1
    attr_reader :balance, :entry_station, :exit_station, :journey_list
  
    def initialize
      @balance = 0
      @journey_list = {}
    end

    def top_up(amount)
      raise "unable to top-up: max top-up limit is £#{LIMIT}" if (amount + @balance) > LIMIT
      @balance += amount
    end

    def touch_in(entry_station)
      raise "unable to touch-in: minimum balance is £#{MINIMUM}" if @balance < MINIMUM
      @entry_station = entry_station
      
    end

    def in_journey?
      @entry_station != nil
    end

    def touch_out(exit_station)
      deduct(1)
      @exit_station = exit_station
      build_journey
    end 

    private
    def deduct(fare)
      @balance -= fare
    end

    def build_journey
      @journey_list[@entry_station] = @exit_station
      @entry_station = nil
    end
end