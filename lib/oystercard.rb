class Oystercard

  attr_reader :balance, :entry_station

  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = nil
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if exceeds_max?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance to touch in" if min_amount?
    @entry_station = station
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @entry_station = nil
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
