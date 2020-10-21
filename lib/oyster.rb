class Oystercard

  MAX_BALANCE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :current_amount, :travelling, :entry_station, :station_log

  def initialize
    @balance = 0
    #@amount
    #@fare = 5
    @travelling = false
    #@entry_station
    @station_log = []
  end

  def top_up(amount)
    fail 'Top up limit reached' if @balance + amount > MAX_BALANCE
    @balance += amount
  end


  def touch_in(station)
    fail 'Insufficient funds' if @balance < MINIMUM_FARE
    @travelling = true
    @entry_station = station
  end

  def touch_out(station)
    deduct(MINIMUM_FARE)
    @travelling = false
    @exit_station = station
    @station_log << {boarding: @entry_station, departure: @exit_station}
  end

  def in_journey?
    @travelling
  end

  private
  def deduct(fare)
    @balance -= fare
  end

end


class Station

attr_reader :zone, :name

  def initialize(name, zone)
    @name = name
    @zone = zone
  end

end
