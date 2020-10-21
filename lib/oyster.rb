class Oystercard

  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :current_amount, :travelling

  def initialize
    @balance = 0
    @amount
    @fare = 5
    @travelling = false
  end

  def top_up(amount)
    fail 'Top up limit reached' if @balance + amount > MAX_BALANCE
    @balance += amount
  end

def deduct(fare)
  @balance -= fare
end

def touch_in
  fail 'Insufficient funds' if @balance < MINIMUM_FARE
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
