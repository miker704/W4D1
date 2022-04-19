require 'byebug'
require_relative "KnightPathFinder.rb"
class PolyTreeNode

    attr_reader :value,:parent,:children
    def initialize(value)
        @value=value
        @parent = nil
        @children=[]
        
        
    end


    #  calls a child to assign its parent node
    def parent=(parent_node)
        # return @parent=nil if some_node==nil

        
        # end
        if parent_node == nil
            @parent.children.delete(self)
            return @parent=nil
        end

        return if parent_node.children.include?(self)

        if @parent!=nil
            @parent.children.delete(self)
            @parent=nil

        end

        @parent=parent_node
        parent_node.children.push(self)
    end


# parent call node to be its child
    def add_child(node)
        node.parent=(self)
    end

    # calls the parent node to remove some child node
    def remove_child(child_node)
        raise 'I have no children!' if self.children.empty?
        raise "thats is not my child!" if !self.children.include?(child_node) 
        child_node.parent=(nil)

    end


# [0]==target 
# self[0] [2,3] -> 2==4 [4,5] 4==

# return result if result != nill 
#  
    # stack
    
    def dfs(target)
        # debugger
        return self if self.value==target 
     
        self.children.each do |child_node|
            result=child_node.dfs(target)
            return result if result!=nil
        end
        
        return nil
    end

    # queue
    def bfs(target)
         
         queue=[self]
        while !queue.empty?
            result=queue.shift
            return result if result.value==target
            queue.concat(result.children)

        end

            return nil
        end

end

