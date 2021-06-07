require 'oystercard'

describe Oystercard do
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
      expect(subject.deduct(1.50)).to eq 48.50
    end

    it 'can touch in the oystercard' do
      expect(subject.touch_in).to eq true
    end

    it 'shows user is in journey' do
      subject.touch_in
      expect(subject.in_journey?).to eq true
    end

    it 'can touch out the oystercard' do
      expect(subject.touch_out).to eq false
    end

    it 'keeps track of when the user is in journey' do
      subject.touch_in
      expect(subject.in_journey?).to eq true
      subject.touch_out
      expect(subject.in_journey?).to eq false
    end
end