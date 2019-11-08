# initializes 3 arrays 
# one array holds all initial disks (4 disks)
# disks should be represented as 1, 10, 100, 1000

# valid move? method
# empty pile anything valid 
# the value of arr[0] MUST be smaller than arr[1] (etc)


# main move method 
# unshifting going on and also shifting

# won? boolean checker 
# 2 of 3 arrays must be .empty?

describe Tower do
  subject(:tower) { Tower.new }
  describe '#initialize' do

    it 'initializes all four disks' do
      expect(tower.start).to eq([1, 10, 100, 1000])
    end

    it 'initializes 2 empty arrays' do
      expect(tower.mid).to eq([])
      expect(tower.right).to eq([])
    end  
  end

  describe '#valid_move?' do

    it 'ensures only the top item can be moved' do
      expect(tower.start).to receive(:shift)
      expect(tower.mid).to receive(:shift)
      expect(tower.right).to receive(:shift)
    end
  end
end