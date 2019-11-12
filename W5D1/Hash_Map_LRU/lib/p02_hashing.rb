class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    answer = ""
    self.each_with_index do |ele,i|
      answer += ele.to_s 
    end
    answer.to_i.hash 
  end
end

class String
  def hash
    answer=""
    alpha = ('a'..'z').to_a
    self.each_char do |char|
      num_char = alpha.index(char)
      answer += num_char.to_s
    end
    answer.to_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    answer = Array.new { Array.new }
    self.map do |k, v|
      answer << [k.to_s + v.to_s].hash
    end
     answer.flatten.hash
  end
end
