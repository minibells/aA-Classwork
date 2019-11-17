module Slideable
  
  def moves
    current_pos = self.pos

    positions = []

    if @diagonal
      positions.concat(diagonal(current_pos))
    end

    if @horz_vert
      positions.concat(vertz(current_pos))
      positions.concat(hortz(current_pos))
    end 

    return positions
  end

  def vertz(pos)
    v = [[0, 1], [0, -1]]
   
    pos_move = []
    row, col = pos
    
    v.each do |dir|
      next_move = [row, (col + dir[0])]
      if square_taken?(next_move)
        pos_move << next_move
        break
     elsif !(valid_pos?(next_move))
        break
      else
        pos_move << next_move
      end
    end
    pos_move
  end
  
  def hortz(pos)
    h = [[1, 0], [-1, 0]]

    pos_move = []
    row, col = pos
   
    h.each do |dir|
      next_move = [(row + dir[0]), col]
      if square_taken?(next_move)
        pos_move << next_move
        break
      elsif !(moves_valid?(next_move))
        break
      else
        pos_move << next_move
      end
    end
    pos_move
  end

  def diagonal(pos)
    diags = [[1, 1], [-1,-1], [1, -1], [-1, 1]]
    pos_move = []
    row, col = pos
    

    diags.each do |dir|
      next_move = [(row + dir[0]), (col + dir[1])]
        if square_taken?(next_move)
          pos_move << next_move
          break
        elsif !(moves_valid?(next_move))
          break
        else
          pos_move << next_move
      end
    end
    pos_move
  end

end 