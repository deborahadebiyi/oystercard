class Oystercard

attr_reader :balance

def initialize
  @balance = 0
  @amount
end

def top_up(amount)
 @balance += amount
end

end
