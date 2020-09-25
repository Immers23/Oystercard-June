require 'station'

describe Station do

  subject {described_class.new("Tooting Bec", 1)}

  it 'knows its name' do
    expect(subject.name).to eq("Tooting Bec")
  end

  it 'knows its zone' do
    expect(subject.zone).to eq(1)
  end
end
