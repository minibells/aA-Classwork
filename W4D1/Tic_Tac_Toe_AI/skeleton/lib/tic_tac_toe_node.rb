require_relative 'tic_tac_toe'



class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos
  attr_writer :next_mover_mark

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    childs = []
    3.times do |i|
      3.times do |j|
        pos = [i, j]
        if @board.empty?(pos)
          dupe = @board.dup
          dupe[pos] = self.next_mover_mark
          self.next_mover_mark = (self.next_mover_mark == :x ? :o : :x)
          childs << TicTacToeNode.new(dupe, self.next_mover_mark, pos)
        end
      end
    end
    childs
  end
end
