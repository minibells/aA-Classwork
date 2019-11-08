require_relative "piece.rb"

class Board

  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }
    @grid[0].each_with_index do |el, i|
      color = "black"
      @grid[0][0] = Rook.new(color, [0, 0], self)
      @grid[0][1] = Bishop.new(color, [0, 1], self)
      @grid[0][2] = Knight.new(color, [0, 2], self)
      @grid[0][3] = Queen.new(color, [0,3 ], self)
      @grid[0][4] = King.new(color, [0, 4], self)
      @grid[0][5] = Knight.new(color, [0, 5], self)
      @grid[0][6] = Bishop.new(color, [0, 6], self)
      @grid[0][7] = Rook.new(color, [0, 7], self)
    end
    @grid[1].each_with_index do |el, i|
       color = "black"
       @grid[1][i] = Pawn.new(color, [1,i], self)
       i += 1
    end

    @grid[6].each_with_index do |el, i|
      color = "white"
      @grid[1][i] = Pawn.new(color, [6,i], self)
      i += 1
    end
    @grid[0].each_with_index do |el, i|
      color = "white"
      @grid[7][0] = Rook.new(color, [7, 0], self)
      @grid[7][1] = Bishop.new(color, [7, 1], self)
      @grid[7][2] = Knight.new(color, [7, 2], self)
      @grid[7][3] = Queen.new(color, [7, 3], self)
      @grid[7][4] = King.new(color, [7, 4], self)
      @grid[7][5] = Knight.new(color, [7, 5], self)
      @grid[7][7] = Bishop.new(color, [7, 6], self)
      @grid[7][7] = Rook.new(color, [7, 7], self)
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  # def move_piece(self_pos, end_pos)

  #   if move_valid?(start_pos) && move_valid?(end_pos)
  #     current_piece = self[start_pos]
  #     self[end_pos] = current_piece
  #     self[start_pos] = nil
  #   end

  # end 

  # def take_piece(end_pos) 
  #   if square_taken?(end_pos)
  #       #do stuff to take the piece for your team
  #   end
     
  # end


  def square_taken?(pos)
    case !(self[end_pos].is_a?(NilPiece))

    when self[self_pos].color == self[end_pos].color
      return false
    when self[self_pos].color != self[end_pos].color
      return true #taken spot will always be arr.last 
    end
    false
  end 
    

  def valid_pos?(start_pos, end_pos)

    case start_pos
      when self[start_pos].nil?
        return false
    end

    case end_pos
      when end_pos[0] > 7 || end_pos[1] > 7
        return false
      when end_pos[0] < 0 || end_pos[1] < 0
        return false
      when !(self[end_pos].is_a?(NilPiece))
        return false
      end
      true
  end



end 