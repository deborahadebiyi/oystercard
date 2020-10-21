require 'oyster'

describe Oystercard do

let(:station){double :station}

  it "#balance" do
    oystercard = Oystercard.new
    expect(subject).to respond_to(:balance)
  end

  it "has a balance that is equal to 0" do
    expect(subject.balance).to eq(0)
  end

  it "#top_up" do
    expect(subject).to respond_to(:top_up)
  end

  it "#top_up takes one argument" do
    expect(subject).to respond_to(:top_up).with(1).arguments
  end

  it "updates the amount" do
    #oystercard = Oystercard.new
    #oystercard.top_up(5)
    expect(subject.top_up(5)).to eq(5)
  end

  it "top_up exceeds max balance" do
    #oystercard = Oystercard.new
    #subject.top_up(Oystercard::MAX_BALANCE)
    expect{subject.top_up(Oystercard::MAX_BALANCE + 1)}.to raise_error 'Top up limit reached'
  end

  # it "deducts fare from current balance" do
  #   #oystercard = Oystercard.new
  #   subject.top_up(40)
  #   expect(subject.deduct(20)).to eq(20)
  # end
  #  can't test private methods


  it "lets oystercard tap in" do
    #barrier = Barrier.new
    #oystercard = Oystercard.new
    subject.top_up(10)
    expect(subject).to respond_to(:touch_in)
    subject.touch_in(station)
    expect(subject.in_journey?).to eq(true)
  end

  it "lets oystercard tap out" do
    #barrier = Barrier.new
    #oystercard = Oystercard.new
    subject.top_up(10)
    expect(subject).to respond_to(:touch_out)
    subject.touch_in(station)
    subject.touch_out
    expect(subject.in_journey?).to eq(false)

  end

  it "checks that the user is not on a journey" do
    expect(subject.in_journey?).to eq(false)
  end

  it "checks the user has more than the minimum balance to touch in" do
    expect{subject.touch_in(station)}.to raise_error 'Insufficient funds'
  end

  it " checks if user is charged minimum fare when touching out" do
    expect {subject.touch_out}.to change{subject.balance}.by(-Oystercard::MINIMUM_FARE)
  end

  it "stores entry station " do
    subject.top_up(10)
    subject.touch_in(station)
    expect(subject.entry_station).to eq station
  end
end





describe Barrier do

end
