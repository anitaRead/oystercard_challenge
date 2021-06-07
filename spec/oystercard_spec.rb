require 'oystercard'

describe Oystercard do
    it 'shows money on the card' do
        expect(subject.balance).to eq 0
    end
end