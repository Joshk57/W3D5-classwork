require_relative "tree_node.rb"

class KnightPathFinder

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
        # should call valid_moves and then filter out any positions that are already
        # in @considered_positions. Then, it should put the new positions into @considered_positions
        # and then return the new positions


    end





end
