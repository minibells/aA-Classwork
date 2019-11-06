require_relative "piece.rb"

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, nil) }
    @grid[0].each_with_index { |el, i| @grid[0][i]= Piece.new }
    @grid[1].each_with_index { |el, i| @grid[1][i]= Piece.new }
    @grid[6].each_with_index { |el, i| @grid[6][i]= Piece.new }
    @grid[7].each_with_index { |el, i| @grid[7][i] = Piece.new }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move_piece(start_pos, end_pos)

    if self[start_pos].nil? && (start_pos[0] > 7 || start_pos[1] > 7)
      raise "There is no piece at #{start_pos}"
  
    elsif (end_pos[0] > 7 || end_pos[1] > 7)
      raise "The piece can not move to #{end_pos}"
    
    else 
      current_piece = self[start_pos]
      self[end_pos] = current_piece
      self[start_pos] = nil
    end
  end 

  # def move_valid?(piece)

  # end



end 