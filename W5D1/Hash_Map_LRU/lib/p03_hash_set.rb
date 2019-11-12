class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if @count == num_buckets
      resize!
    end

    if !self.include?(key)
      i = key.hash % num_buckets
      @store[i] << key.hash
      @count += 1
    end
  end

  def include?(key)
    i = key.hash % num_buckets
    if @store[i].include?(key.hash)
      return true
    else
      false
    end
  end

  def remove(key)
      if self.include?(key)
      @store.delete(@store[key.hash % num_buckets])
      @count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
         memo = @store.dup
      @store = Array.new(2 * num_buckets) { Array.new }
      memo.each_with_index do |bucket, i|
        bucket.each_with_index do |ele, i2|
          @store[ele % @store.length] << ele
        end
      end      
  end
end
