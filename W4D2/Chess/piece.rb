class Piece

  attr_accessor :pos

  def initialize

  end

  def moves
    pos_moves = []
    pos_moves
  end

end

class Bishop < Piece
  def move_dirs
  end
end

class Rook < Piece
  def move_dirs
  end
end

class Knight < Piece
  
end

class Queen < Piece
  def move_dirs
  end
end

class King < Piece
  
end

class Pawn < Piece
  
end

class NullPiece < Piece
  require 'singleton'

  def initialize
    super
  end

end