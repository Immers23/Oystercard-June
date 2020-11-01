require 'journey_log'

describe JourneyLog do

  it 'initializes with a journey class parameter' do
    allow(Journey).to receive(:new).and_return('test')
    new_log = JourneyLog.new
    expect(new_log.current_journey.new).to eq 'test'
    # or another test that works
    # new_log = JourneyLog.new
    # expect(new_log.current_journey).to eq Journey
  end
end
