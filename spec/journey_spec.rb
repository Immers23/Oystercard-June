require 'journey'

describe Journey do

  let(:station) { double :station}

  it 'should be an empty journey before journey' do
    expect(subject.journey).to be_empty
  end

  it 'should save entrance station' do
    subject.set_entry(station)
    expect(subject.journey).to include(:entrance_station => station)
  end

  it 'should save exit station' do
    subject.set_exit(station)
    expect(subject.journey).to include(:exit_station => station)
  end

  it 'should return minimum fare for complete journey' do
    subject.set_entry(station)
    subject.set_exit(station)
    expect(subject.fare).to eq Oystercard::MINIMUM_CHARGE
  end

  it 'should return 6 for no exit station' do
    subject.set_entry(station)
    expect(subject.fare).to eq Oystercard::PENALTY_FARE
  end

  it 'should return 6 for no entry station' do
    subject.set_exit(station)
    expect(subject.fare).to eq Oystercard::PENALTY_FARE
  end

  it 'should return 6 for no entry or exit station' do
    # subject.set_entry(station)
    expect(subject.fare).to eq Oystercard::PENALTY_FARE
  end


end
