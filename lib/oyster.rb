class Oystercard

  MAX_BALANCE = 90

  attr_reader :balance, :current_amount

  def initialize
    @balance = 0
    @amount
    @max_balance = MAX_BALANCE
  end

  def top_up(amount)
    current_amount = @balance += amount
    if @balance > @max_balance
      return "Top up limit reached"
    else
      return current_amount
    end
  end

end
