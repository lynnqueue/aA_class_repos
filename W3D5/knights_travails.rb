require "./lib/00_tree_node.rb"


class KnightPathFinder

    
    def initialize(root_position) #[0, 0]
        @root_node = PolyTreeNode.new(root_position)
        @root_position = root_position
        @grid = Array.new(8) {Array.new(8)}
        @considered_positions = [root_position]
        self.build_move_tree
    end

    def build_move_tree
        array = [@root_node] 
        until array.empty?
            first_node = array.shift
            new_move_positions(first_node.value).each do |position|
                 next_node = PolyTreeNode.new(position)
                 next_node.parent=(first_node)
                 first_node.add_child(next_node)
                 array << next_node
            end 
        end
    end

    def self.valid_moves(pos) #see possible valid moves from position
        pos_moves = [[1, -2], [2, -1], [1, 2], [2, 1], [-2, -1], [-2, 1], [-1, -2], [-1, 2]]
        row = pos.first
        col = pos.last

        possible_pos = pos_moves.map do |move| #[1,-2]
            [move.first + row, move.last + col] 
        end
        valid_pos = possible_pos.select do |position|
            #if pos[0] is between 0 and 7 means its possible move AND
            #if pos[1] is between 0 and 7 means its posbbile
            (0..7).include?(position.first) && (0..7).include?(position.last)
        end
        valid_pos 
    end

    def new_move_positions(pos) #array of new moves that havent been considered before
        result = []
         KnightPathFinder.valid_moves(pos).each do |valid_pos| 
            if !@considered_positions.include?(valid_pos)
                result << valid_pos
                @considered_positions << valid_pos
            end
         end
        result 
    end

    def find_path(end_pos)
        @root_node.bfs(end_pos)
    end

    def trace_path_back
        end_node = self.find_path(end_pos)
        path = [end_node.value]
        current_parent = end_node.parent
        until current_parent == nil
            path << current_parent.value 
            current_parent = current_parent.parent  
        end
        path
    end
   
end


