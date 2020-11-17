require 'journey_log'

describe JourneyLog do
  let(:old_street){double('old_street')}
  let(:journey){double :journey, :entrance_station => nil, :exit_station => nil}
  let(:journey_class){double :journey_class, :new => journey}

  subject{JourneyLog.new}

  it 'initializes with a journey class parameter' do
    new_log = JourneyLog.new
    expect(new_log.current_journey.class).to eq Journey
  end

  it 'journeys array is empty by default' do
    expect(subject.journeys).to eq []
  end

  it 'initializes with a journey class parameter' do
    allow(Journey).to receive(:new).and_return('this')
    new_log = JourneyLog.new
    expect(new_log.current_journey).to eq 'this'
  end

  it 'starts new journey with entry station' do
    old_street = double("old_street", :name => 'Old Street', :zone => 1 )
    subject.start(old_street)
    expect(subject.entry_station).to eq old_street
  end

end
