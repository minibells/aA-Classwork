

module Steppable

   def moves
      current_pos = self.pos
      positions = []

      if @king
         positions.concat(king_moves(current_pos))
      end

      if @knight
         positions.concat(knight_moves(current_pos))
      end 
      return positions
  end

   def knight_moves(pos)
      pos_moves = []
      row, col = pos
      moves = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
      
      moves.each do |move|
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

   def king_moves 
      pos_moves = []
      row, col = pos
      moves = [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [-1,-1], [1, -1], [-1, 1]]

      moves.each do |move|
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

