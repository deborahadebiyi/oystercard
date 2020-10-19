require 'oyster'

describe Oystercard do

  it "#balance" do
    oystercard = Oystercard.new
    expect(subject).to respond_to(:balance)
  end

  it "has a balance that is equal to 0" do
    expect(subject.balance).to eq (0)
  end
end
