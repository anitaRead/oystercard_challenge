class Oystercard
    LIMIT = 90
    attr_reader :balance, :in_journey
  

    def initialize
      @balance = 0
      @in_journey = false
    end

    def top_up(amount)
      raise "unable to top-up: max top-up limit is £#{LIMIT}" if (amount + @balance) > LIMIT
      @balance += amount
    end

    def deduct(fare)
      @balance -= fare
    end

    def touch_in
      @in_journey = true
    end

    def in_journey?
      @in_journey
    end

    def touch_out
      @in_journey = false
    end 
end