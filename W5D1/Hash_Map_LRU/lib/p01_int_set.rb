class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    if num >= @store.length || num < 0
      raise "Out of bounds" 
    else
      @store[num] = true
      true
    end
  end

  def remove(num)
    @store.delete(num)
    @store[num] = false
  end

  def include?(num)
    if @store[num] == true
      return true
    else
      false
    end
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  attr_accessor :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    i = num % 20
    @store[i] << num
  end

  def remove(num)
    @store.delete(@store[num % 20] )
  end

  def include?(num)
     i = num % 20
     if @store[i].include?(num)
      return true
    else
      false
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if @count == num_buckets
      resize!
    end

    if !self.include?(num)
      i = num % num_buckets
      @store[i] << num
      @count += 1
    end
    
  end

  def remove(num)
    if self.include?(num)
      @store.delete(@store[num % num_buckets])
      @count -= 1
    end
  end

  def include?(num)
    i = num % num_buckets
    if @store[i].include?(num)
      return true
    else
      false
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


