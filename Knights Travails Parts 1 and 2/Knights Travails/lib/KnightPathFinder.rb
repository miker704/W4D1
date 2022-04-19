require_relative "00_tree_node.rb"
class KnightPathFinder
attr_reader :considered_positions,:root_node
  def initialize(start_pos)
      @grid=Array.new(8){Array.new(8)}
      @considered_positions=[start_pos]
      @root_node = PolyTreeNode.new(start_pos)
      self.build_move_tree


  end



  def find_path(end_pos)
      result=@root_node.dfs(end_pos)
      result
    
  end

  def trace_back(end_node)
      path=[end_node.value]
      current=end_node
      while(current.parent!=nil)
        path<<current.value
        current=current.parent
      end
      


      return path
  end

  def new_move_positions(pos)
        temp=KnightPathFinder.valid_moves(pos)
        temp.reject!{|ele| @considered_positions.include?(ele)}
        @considered_positions.concat(temp)
        return temp
  end

  def self.valid_moves(pos)
      curr_x,curr_y = pos
      #moveset
      left_right = [2, 1, -1, -2, -2, -1, 1, 2];
      up_down = [1, 2, 2, 1, -1, -2, -2, -1];
      i=0
      new_moves=[]


      while(i<8)
            new_x = curr_x+ left_right[i]
            new_y = curr_y+ up_down[i]
        
            if new_x>=0 && new_y>=0 && new_x<=7 && new_y<=7
                new_moves<<[new_x,new_y]
            end
            i+=1
      end
        
      return new_moves
      
  end
  

    def build_move_tree
        
         
         queue=[@root_node]


        while !queue.empty?
            result=queue.shift
           
            new_children=new_move_positions(result.value)

            new_children.each{|ele|  result.add_child(PolyTreeNode.new(ele))}
          
      
            queue.concat(result.children)



          
        end
            
    end

end

