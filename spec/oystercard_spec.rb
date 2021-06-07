require 'oystercard'

describe Oystercard do
    it 'shows money on the card' do
        expect(subject.balance).to eq 0
    end

    it 'can top-up the balance' do
      subject.top_up(12)
      expect(subject.balance).to eq 12
    end
end