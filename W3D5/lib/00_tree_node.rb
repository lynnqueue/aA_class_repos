
class PolyTreeNode
    attr_reader :parent, :children, :value, :position

    # def root_node(position)
    #     @position
    # end

    def initialize(value) #value => root_node
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent) 
        # debugger
        #node2.parent (node1) = (node1)
        if new_parent == nil 
           return @parent = nil 
        end

        if new_parent != parent 
            new_parent.children << self if !new_parent.children.include?(self)  
            self.parent.children.delete(self) if self.parent != nil
            
            @parent = new_parent 
        end
          

    end

    def add_child(child_node) 
        if !self.children.include?(child_node)
            child_node.parent = self
        end
    end

    def remove_child(child_node)
        if self.children.include?(child_node)
        child_node.parent = nil
        else 
            raise "error"
        end
    end

    def dfs(target_value) #node_a.dfs(a)
        return self if self.value == target_value #node_a

        self.children.each do |child| 
            result = child.dfs(target_value) 
            return result unless result == nil
        end
        return nil
    end

    def bfs(target_value)
        array = [self]# [nodes] <- until this array is empty

        until array.empty?
            node = array.shift
            if node.value == target_value 
                return node
            else
                node.children.each {|child| array << child}
            end
        end
        return nil
    end

    def inspect
        {"value" => @value, "children" => @children, "parent" => @parent }
    end
end

