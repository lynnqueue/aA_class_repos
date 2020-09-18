require "./lib/00_tree_node.rb"


class KnightPathFinder

    attr_reader :grid
    def initialize(root_position)
        @root_position = PolyTreeNode.new.root_node(root_position)
        @grid = Array.new(8) {Array.new(8)}

    end

    def self.valid_moves(pos)

    end

end
