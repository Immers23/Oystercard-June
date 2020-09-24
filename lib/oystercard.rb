class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :journeys, :one_journey

  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @one_journey = {}
    @journeys = []
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if exceeds_max?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance to touch in" if min_amount?
    @one_journey[:entry_station] = station
  end

  def touch_out(station)
    deduct(MINIMUM_CHARGE)
    @one_journey[:exit_station] = station
    @journeys << @one_journey
    @one_journey = {}
  end

  def in_journey?
    @one_journey.any?
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
