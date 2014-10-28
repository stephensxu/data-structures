require_relative 'linked_list'
require_relative 'stack'

# Implement a basic (recursive) Binary Tree

def BinaryTree(value)
  case value
  when BinaryTree
    value
  else
    BinaryTree.new(value)
  end
end

# For traversal, see
# http://en.wikipedia.org/wiki/Tree_traversal#Implementations

class BinaryTree
  attr_accessor :value, :left, :right

  def initialize(value = nil)
    @value = value
    @left = left
    @right = right
  end

  def each(&block)
  end

  # Implement pre-order traversal of the tree
  def pre_order(&block)
    if self.value
      block.call(self.value)
    elsif self.left
      block.call(self.left)
    elsif self.right
      block.call(self.right)
    end
  end

  # Implement in-order traversal of the tree
  def in_order(&block)
    if self.left
      block.call(self.left)
    elsif self.value
      block.call(self.value)
    elsif self.right
      block.call(self.right)
    end
  end

  # Implement post-order traversal of the tree
  def post_order(&block)
    if self.left
      block.call(self.left)
    elsif self.right
      block.call(self.right)
    elsif self.value
      block.call(self.value)
    end
  end
end
