require 'oystercard'

describe Oystercard do
    let(:entry_station) { double :entry_station }
    let(:exit_station) { double :exit_station }

    it 'shows money on the card' do
        expect(subject.balance).to eq 0
    end

    it 'can top-up the balance' do
      subject.top_up(12)
      expect(subject.balance).to eq 12
    end

    it 'raises an error if balance exceeds limit' do
      expect { subject.top_up(100) }.to raise_error 'unable to top-up: max top-up limit is £90'
    end

    it 'deducts money from the balance' do
      subject.top_up(50)
      subject.touch_out(exit_station)
      expect(subject.balance).to eq 49
    end

    it 'can touch in the oystercard' do
      subject.top_up(2)
      expect(subject.touch_in(entry_station)).to eq entry_station
    end

    it 'shows user is in journey' do
      subject.top_up(2)
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to eq true
    end

    it 'can touch out the oystercard' do
      subject.top_up(2)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.in_journey?).to eq false
    end

    it 'keeps track of when the user is in journey' do
      subject.top_up(2)
      subject.touch_in(entry_station)
      expect(subject.in_journey?).to eq true
      subject.touch_out(exit_station)
      expect(subject.in_journey?).to eq false
    end

    it 'raises error if user tries to touch in with less than minimum amount' do
      expect { subject.touch_in(entry_station) }.to raise_error "unable to touch-in: minimum balance is £1"
    end
    
    it 'deducts fare on touch-out' do
      subject.top_up(20)
      expect { subject.touch_out(exit_station) }.to change{subject.balance}.by(-1)
    end

    it 'will save the entry station after touch-in' do
      subject.top_up(20)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq(entry_station)
    end

    it 'will forget entry station upon touch-out' do
      subject.top_up(20)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq nil
    end

    it 'will save the exit station after touch-out' do
      subject.top_up(20)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.exit_station).to eq(exit_station)
    end 

    it 'will return the previous journey' do
      subject.top_up(20)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journey_list).to eq({entry_station => exit_station})
    end

    it 'will return two previous journeys' do
      subject.top_up(50)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.journey_list).to eq({
        entry_station => exit_station,
        entry_station => exit_station})
    end

    it 'has a default empty journey list' do
      expect(subject.journey_list).to be_empty
    end

end