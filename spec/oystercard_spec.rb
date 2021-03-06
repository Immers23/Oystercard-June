require 'oystercard'

describe Oystercard do

  let(:entry_station){ double :station }
  let(:exit_station) { double :station }

  it 'has a balance of 0' do
    expect(subject.balance).to eq (0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

  end

  it 'will not touch in if below minimum balance' do
    expect{ subject.touch_in(entry_station) }.to raise_error "Insufficient balance to touch in"
  end

  it 'raises an error if the maximum balance is exceeded' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect{ subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
  end

end
