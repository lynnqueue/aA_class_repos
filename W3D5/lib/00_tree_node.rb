
# class PolyTreeNode
#     attr_reader :parent, :children, :value, :position

#     # def root_node(position)
#     #     @position
#     # end

#     def initialize(value) #value => root_node
#         @value = value
#         @parent = nil
#         @children = []
#     end

#     def parent=(new_parent) 
#         # debugger
#         #node2.parent (node1) = (node1)
#         if new_parent == nil 
#            return @parent = nil 
#         end

#         if new_parent != parent 
#             new_parent.children << self if !new_parent.children.include?(self)  
#             self.parent.children.delete(self) if self.parent != nil
            
#             @parent = new_parent 
#         end
          

#     end

#     def add_child(child_node) 
#         if !self.children.include?(child_node)
#             child_node.parent = self
#         end
#     end

#     def remove_child(child_node)
#         if self.children.include?(child_node)
#         child_node.parent = nil
#         else 
#             raise "error"
#         end
#     end

#     def dfs(target_value) #node_a.dfs(a)
#         return self if self.value == target_value #node_a

#         self.children.each do |child| 
#             result = child.dfs(target_value) 
#             return result unless result == nil
#         end
#         return nil
#     end

#     def bfs(target_value)
#         array = [self]

#         until array.empty?
#             node = array.shift
#             if node.value == target_value 
#                 return node
#             else
#                 node.children.each {|child| array << child}
#             end
#         end
#         return nil
#     end

#     def inspect
#         {"value" => @value, "children" => @children, "parent" => @parent }
#     end
# end

require "byebug"

class PolyTreeNode

    attr_reader :value, :parent, :children
    attr_writer :parent

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end 

    def parent=(node)
        return if parent == node
        parent.children.delete(self) if !parent.nil?
        @parent = node 
        node.children << self if !node.nil? && !node.children.include?(self)        
    end

    def add_child(node)
        node.parent = self 
    end 

    def remove_child(node)
        if children.include?(node)
            node.parent = nil 
        else  
            raise "#{node} is not a child of #{self}" 
        end 
    end 

    def dfs(target_value)
        return self if value == target_value
        children.each do |child|
            result = child.dfs(target_value)
            return result if !result.nil?
        end 
        nil 
    end 

    def bfs(target_value)
        return self if value == target_value

        queue = [self]
        until queue.empty?
            current = queue.shift
            if current.value == target_value
                return current
            else  
                current.children.each {|child| queue << child}
            end 
        end 
        nil 
    end 

    node1 = PolyTreeNode.new(1)
    node2 = PolyTreeNode.new(2)
    node3 = PolyTreeNode.new(3)
    node4 = PolyTreeNode.new(4)
    node5 = PolyTreeNode.new(5)
    node6 = PolyTreeNode.new(6)
    node7 = PolyTreeNode.new(7)
    node2.parent = node1
    node3.parent = node1
    node4.parent = node2
    node5.parent = node2
    node6.parent = node4
    node7.parent = node3

    p node1.bfs(7)


    # def bfs(target_value)
    #     array = [self]

    #     until array.empty?
    #         node = array.shift
    #         if node.value == target_value 
    #             return node
    #         else
    #             node.children.each {|child| array << child}
    #         end
    #     end
    #     return nil
    # end


    def inspect
        {"value" => @value, "parent_value" => @parent.value}.inspect
    end 
end 