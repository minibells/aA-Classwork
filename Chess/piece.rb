require_relative "board.rb"

class Piece
  attr_accessor :pos, :color, :board

  def initialize(color, pos, board)
    @color = color
    @board = board
    @pos = pos

  end

  def moves
    pos_moves = []
    pos_moves
  end

  def move_into_check

  end

end

class Bishop < Piece
  include Slideable
  def initialize(color, pos, board)
    @diagonal = true
    # @symbol = ♗
    super
  end 
end

class Rook < Piece
  include Slideable
  def initialize(color, pos, board)
    @horz_vert = true
    # @symbol = ♖
    super
  end
end

class Queen < Piece
  include Slideable
  def initialize(color, pos, board)
    @horz_vert = true
    @diagonal = true
    # @symbol = ♕
    super
  end
end

class King < Piece
  include Steppable
  def initialize(color, pos, board)
    @king = true
    # @symbol = ♔
    super
  end
end

class Knight < Piece
  include Steppable
  def initialize(color, pos, board)
    @knight = true
    # @symbol = ♘
    super
  end
  
end

class Pawn < Piece
  include Slideable
  include Steppable

  attr_reader :dir
  def initialize(color, pos, board) 
    # @symbol = ♙
    @dir = 0
    # at_start_row? 
    super
  end

  

  def at_start_row?
    if self[row] == 1
      @dir = 1 
    elsif self[row] == 6
      @dir = -1 
    else
      false
    end
  end

  def move
    possible = []
    if self.dir == 1 && self[row] == 1
      possible << self.pos[row + @dir][col]
      possible << self.pos[row + (@dir * 2)][col]
    else
      possible << self.pos[row + @dir][col]
    end
  end

  def side_attack
    if self.pos[0 + @dir][1 + @dir] != nil
      self.pos[0 + @dir][1 + @dir] = self
      self.pos = nil
    elsif self.pos[0 + @dir][1 - @dir] != nil
      self.pos[0 + @dir][1 - @dir] = self
      self.pos = nil
    end
  end
end

class NullPiece < Piece
  include Singleton
  def initialize(color, pos, board)
    super 
  end

end