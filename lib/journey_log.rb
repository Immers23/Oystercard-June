require_relative 'journey'

class JourneyLog

  attr_accessor :current_journey, :journeys

  # def initialize(journey_class_inject)
  #   @journey_classs = journey_class_inject
  #   @journeys = []
  #   @current_journey = journey_class.new
  # end

  def initialize(journey_class: Journey.new)
    @current_journey = journey_class
    @journeys = []
  end

  def start(station)
    current_journey.set_entry(station)
  end

  def entry_station
    current_journey.journey[:entrance_station]
  end

end
