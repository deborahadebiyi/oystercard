require 'oyster'

describe Oystercard do

  it "#balance" do
    oystercard = Oystercard.new
    expect(subject).to respond_to(:balance)
  end

  it "has a balance that is equal to 0" do
    expect(subject.balance).to eq (0)
  end

  it "#top_up" do
    expect(subject).to respond_to(:top_up)
  end

  it "#top_up takes one argument" do
    expect(subject).to respond_to(:top_up).with(1).arguments
  end

  it "updates the amount" do
    oystercard = Oystercard.new
    oystercard.top_up(5)
    expect(subject.top_up(5)).to eq(5)
  end
end
