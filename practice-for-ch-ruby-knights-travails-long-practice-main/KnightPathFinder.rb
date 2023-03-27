require_relative "tree_node.rb"

class KnightPathFinder
    attr_reader :root_node
    def self.valid_moves(pos)
        x, y = pos
        output = []
        if x + 2 < 8 && y + 1 < 8
            output << [x+2, y+1]
        end
        if x + 2 < 8 && y - 1 >= 0
            output << [x+2, y-1]
        end
        if x + 1 < 8 && y - 2 >= 0
            output << [x+1, y-2]
        end
        if x - 1 >= 0 && y - 2 >= 0
            output << [x-1, y-2]
        end
        if x - 2 >= 0 && y - 1 >= 0
            output << [x-2, y-1]
        end
        if x - 2 >= 0 && y + 1 < 8
            output << [x-2, y+1]
        end
        if x - 1 >= 0 && y + 2 < 8
            output << [x-1, y+2]
        end
        if x + 1 < 8 && y + 2 < 8
            output << [x+1, y+2]
        end

        return output
    end

    def initialize(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_positions = [pos]
    end

    def new_move_positions(pos)
        # should call valid_moves and
        # then filter out any positions that are already in @considered_positions.
        #  Then, it should put the new positions into @considered_positions
        # and then return the new positions
        all_possible_moves = KnightPathFinder.valid_moves(pos)
        new_positions = []
        all_possible_moves.each do |move|
            if !@considered_positions.include?(move)
                @considered_positions << move
                new_positions << move
            end
        end
        new_positions
    end

    def build_move_tree
        queue = new_move_positions(@root_node.value)
        parent_queue = queue.map {|ele| @root_node}
        while !queue.empty?
            position = queue.shift
            child_node = PolyTreeNode.new(position)
            child_node.parent = parent_queue.shift
            new_positions = new_move_positions(position)
            queue.concat(new_positions)
            parent_queue.concat(new_positions.map {|ele| child_node})
        end
        # p @root_node.children


    end

    def find_path(end_pos)
        build_move_tree
        trace_path_back(@root_node.bfs(end_pos))

    end

    def trace_path_back(end_node)
        path_nodes = [end_node]

        while !path_nodes[0].parent.nil?
            path_nodes.unshift(path_nodes[0].parent)
        end

        path_nodes.map do |node|
            node.value
        end


    end


end



kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]