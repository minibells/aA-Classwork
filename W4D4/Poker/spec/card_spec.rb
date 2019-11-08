#1, 2, 3, 4.... >> num_card
#jack, queen, king, ace
#joker

#init >> color, symbol


describe Card do

  describe '#initialize' do
    it 'should have a color' do
      expect(card.color).to eq(:red)
    end

    # it 'should have a symbol' do
    #   expect(card.symbol).to eq('♠')
    # end

    it 'should have a value' do
      expect(card.value).to eq('1')
    end
  end
  
end