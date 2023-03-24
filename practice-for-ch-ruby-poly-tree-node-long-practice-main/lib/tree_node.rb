class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        @parent.children.delete(self) if !@parent.nil?
        @parent = new_parent
        if !@parent.nil?
            @parent.children << self
        end
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise 'Not a child' if !children.include?(child_node)
        child_node.parent = nil
    end

    def bfs(target_value)
        # return self if self.value == target_value
        array = [self]
        while !array.empty?
            node = array.shift
            if node.value == target_value
                return node
            else
                array.concat(node.children)
            end
        end
        return nil
    end

end
