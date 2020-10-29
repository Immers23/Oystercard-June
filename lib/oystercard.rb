require_relative 'station'
require_relative 'journey'
require_relative 'journey_log'

class Oystercard

  attr_reader :balance, :journey

  MAXIMUM_BALANCE = 90
  MINIMUM_CHARGE = 1
  MINIMUM_BALANCE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @journey = journey
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise "Maximum balance of #{MAXIMUM_BALANCE} exceeded" if exceeds_max?(amount)
    @balance += amount
  end

  def touch_in(station)
    raise "Insufficient balance to touch in" if min_amount?
    journey.set_entry(station)
  end

  def touch_out(station)
    deduct(journey.fare)
    journey.set_exit(station)
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
