class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys, :one_journey

  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @one_journey
    @journeys = []
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if exceeds_max?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance to touch in" if min_amount?
    @entry_station = station
  end

  def touch_out(station)
    @exit_station = station
    @one_journey = {entry_station: @entry_station, exit_station: @exit_station}
    @journeys << @one_journey
    @entry_station = nil
    deduct(MINIMUM_CHARGE)
  end

  def in_journey?
    !!entry_station
  end


  private

  def min_amount?
    @balance < MINIMUM_BALANCE
  end

  def exceeds_max?(amount)
    @balance + amount > MAXIMUM_BALANCE
  end

  def deduct(amount)
    @balance -= amount
  end


end
