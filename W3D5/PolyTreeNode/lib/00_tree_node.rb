require "byebug"

class PolyTreeNode
    
     attr_reader :value, :parent, :children

     def initialize(value)
        @value = value
        @parent = nil
        @children = []
     end

     def parent=(node)
        @parent.children.delete(self) unless @parent == nil
        @parent = node
        node.children << self unless @parent == nil || node.children.include?(self)
     end

     def add_child(node)
        node.parent = self
     end

     def remove_child(node)
        if node.parent != nil
            node.parent = nil
        else
            raise "that node is not a child"
        end
     end

     def dfs(target_value)
    
        return self if self.value == target_value

        self.children.each do |child|
            target = child.dfs(target_value)
            return target unless target == nil
        end
        nil
     end

     def bfs(target_value)
      queue = [self]
      
         queue.each do |node|
            if node.value == target_value
                return node
            else
                node.children.each do |child|
                    queue << child
                end
            end
         end
      nil
    end


end



