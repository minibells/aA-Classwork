#init -- 54 cards 
# 2 jokers, 4 aces, 4 kings, 4 queens, 4 jacks, 4 suites (1..10)

describe Deck do

  subject(:deck) { Deck.new }

  describe "#initialize" do

    it "initializes 52 cards" do
      expect(deck.length).to eq(52)
    end

    # it "creates an array with 4 suites" do
    #   expect(deck.suite).to eq(['♠'️, '♣', '♦', '♥'️])
    # end

    it "expects 26 cards to have color red" do
      expect(deck.count { |card| card.color == :red }).to eq(26)
    end

    it "expects 26 cards to have color black" do
      expect(deck.count { |card| card.color == :black }).to eq(26)
    end

    it "expects 4 of each value" do
      before(:each)
      expect(count_vals = Hash.new(0) ; deck.each { |card| count_vals[card.value] += 1 } ; count_vals["1"]).to eq(4) 

    end
  end
  
end