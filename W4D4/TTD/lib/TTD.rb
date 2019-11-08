class Array

  def my_uniq
    unique = []
    self.each do |ele|
      unique << ele if !unique.include?(ele)
    end
    unique
  end

  def two_sum
    pairs = []
    (0...self.length).each do |i|  
      (i...self.length).each do |j|
        if self[i] + self[j] == 0 && i != j
          pairs << [i,j]
        end
      end
    end
    pairs
  end

  def my_transpose
    results = Array.new(self.length) { Array.new(self.length) }

    (0...self.length).each do |i|
      (0...self.length).each do |j|
        results[j][i] = self[i][j]
      end
    end
    results
  end

end

def stock_picker(arr)
  price_track = Hash.new { |h, k| h[k] = [] }

  (0...arr.length).each do |i|
    (i...arr.length).each do |j|
      sum = arr[j] - arr[i]
      price_track[sum] = [i, j]
    end
  end
  max = price_track.keys.max { |x, y| x <=> y }
  price_track[max]
end



