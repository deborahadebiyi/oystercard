class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance, :current_amount, :travelling

  def initialize
    @balance = 0
    @amount
    @max_balance = MAX_BALANCE
    @fare = 5
    @travelling = false
  end

  def top_up(amount)
    current_amount = @balance += amount
    if @balance > @max_balance
      return "Top up limit reached"
    else
      return current_amount
    end
  end

def deduct(fare)
  @balance -= fare
end

def touch_in
  @travelling = true
end

def touch_out
  @travelling = false
end

def in_journey?
  @travelling
end
end


class Barrier


end
