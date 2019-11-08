require 'TTD'

describe Array do
  
  describe '#my_uniq' do
    subject(:arr) { Array.new([1, 1, 2, 1, 3, 3]) }

    it 'Does not call Array#uniq' do
      expect(arr).not_to receive(:uniq) 
    end

    it 'removes duplicates from array' do
      expect([1, 2, 1, 3, 3].my_uniq).to eq([1, 2, 3])
    end

    it 'does not modify the original array' do
       expect(arr.my_uniq).not_to be(arr)
    end
  end

  describe "#two_sum" do
    subject(:arr) { Array.new([-1, 1, 2, 1, -3, 3]) }

    it "returns pair positions that sum to 0" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it "does not include spurious pairs" do
      expect([-1, 0, 2, -2, 1].two_sum).not_to eq([[0,0],[1,1]])
    end

    it "sorts the pairs dictionary wise" do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0,4],[2,3]])
    end
  end

  describe '#my_transpose' do
    subject(:arr) { Array.new( [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8]
      ]) }

    it 'transposes the array' do
      expect(arr.my_transpose).to eq([
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8]
      ])
    end

    it 'Does not call Array#transpose' do
      expect(arr).not_to receive(:transpose) 
    end

    it 'does not modify the original array' do
       expect(arr.my_transpose).not_to be(arr)
    end
  end

end

describe '#stock_picker' do
  subject(:arr) { Array.new([100, 90, 80, 110, 120, 90, 70]) }

  it 'selects the most profitable day to buy' do
    expect(stock_picker(arr)[0]).to eq(2) # [80, 120] => [2, 4]
  end

  it 'selects the most profitable day to sell' do
    expect(stock_picker(arr)[1]).to eq(4) 
  end

  it 'cannot sell stock before buying it' do
    expect(stock_picker(arr)[0]).to be < stock_picker(arr)[1]
  end


end