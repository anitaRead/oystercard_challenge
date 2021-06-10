require 'station'

describe Station do
    subject(:station) { described_class.new("Hendon", 4) }

    it 'will return the name of a station' do
        expect(station.name).to eq("Hendon")
    end
    
    it 'will return the zone of a station' do
        expect(station.zone).to eq(4)
    end

end