require_relative 'journey'

class JourneyLog

  attr_reader :current_journey

  # attr_reader :journey_class
  #
  # def initialize(journey_class_inject)
  #   @journey_class = journey_class_inject
  #   @journeys = []
  #   @current_journey = journey_class.new
  # end

  def initialize(journey_class: Journey)
    @current_journey = journey_class
    @journeys = []
  end

end
