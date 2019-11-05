require_relative "poly_tree.rb"

class KnightPathFinder

  @@VALID_MOVEMENT = [
    [2, 1], 
    [2, -1], 
    [-2, 1], 
  [-2, -1], 
  [1, 2], 
  [1, -2], 
  [-1, 2], 
  [-1, -2]
]

  attr_reader :moves, :grid, :root_node, :current_position



  def initialize(start_pos)
    @considered_positions = [start_pos]
    @root_node = PolyTreeNode.new(start_pos)
    @root_position = @root_node.value
    self.build_move_tree
  end


  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end
  
  def self.valid_moves(pos)
    row, col = pos 
    valid_move = []

    @@VALID_MOVEMENT.each do |sub_pos| 
      if (row + sub_pos[0] < 8 && row + sub_pos[0] >= 0) && 
        (col + sub_pos[1] < 8 && col + sub_pos[1] >= 0)
        valid_move << [(row + sub_pos[0]), (col + sub_pos[1])]
      end
    end
    valid_move
 
  end

  def new_move_positions(pos)
    resulting_children = []
    children = KnightPathFinder.valid_moves(pos)

    children.each do |child_pos|
    unless @considered_positions.include?(child_pos)
      @considered_positions << child_pos
      resulting_children << child_pos
      end
    end
    resulting_children
  end

  def build_move_tree
    queue = [@root_node]

  
    until queue.empty? 
      current_node = queue.shift
      new_children = new_move_positions(current_node.value)

      new_children.each do |child_pos|
        child = PolyTreeNode.new(child_pos)
        current_node.add_child(child)
        queue << child
      end
    end
    @root_node
  end


      
  def find_path(goal_pos)
    paths = [goal_pos]
    current_position = @root_node.bfs(goal_pos)

    until paths.first == @root_node.value

     paths.unshift(current_position.parent.value)
     current_position = @root_node.bfs(paths.first)
       
    end
    paths
  end

end 


