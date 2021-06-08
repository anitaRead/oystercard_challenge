require 'station'

describe Station do

    it 'will return the name of a station' do
        station = Station.new("Hendon")
        expect(station.name).to eq("Hendon")
    end
    
    it 'will return the zone of a station' do
        station = Station.new("Hendon")
        expect(station.zone).to eq(4)
    end

end