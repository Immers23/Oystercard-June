require_relative 'journey_log'
# require_relative 'journey'
# require_relative 'station'

class Oystercard

  attr_accessor :balance, :journey_log

  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1
  MINIMUM_BALANCE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if exceeds_max?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance to touch in" if min_amount?
    journey_log.start(station)
  end

  def touch_out(station)
    journey.set_exit(station)
    deduct(journey.fare)
    journey.reset_journey
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
