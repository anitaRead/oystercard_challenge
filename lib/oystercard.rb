class Oystercard
    LIMIT = 90
    MINIMUM = 1
    attr_reader :balance, :entry_station
  
    def initialize
      @balance = 0
      @entry_station 
    end

    def top_up(amount)
      raise "unable to top-up: max top-up limit is £#{LIMIT}" if (amount + @balance) > LIMIT
      @balance += amount
    end

    def touch_in(entry_station)
      raise "unable to touch-in: minimum balance is £#{MINIMUM}" if @balance < MINIMUM
      @entry_station = entry_station
      @in_journey = true
    end

    def in_journey?
      @entry_station != nil
    end

    def touch_out
      deduct(1)
      @entry_station = nil
      @in_journey = false
    end 

    private
    def deduct(fare)
      @balance -= fare
    end
end