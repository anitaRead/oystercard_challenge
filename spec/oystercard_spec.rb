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
end