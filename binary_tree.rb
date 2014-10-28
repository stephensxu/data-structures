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

  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def each(&block)
    self.pre_order(&block)
  end

  # Implement pre-order traversal of the tree
  def pre_order(&block)
    block.call(self.value)
    self.left.pre_order(&block)  if self.left
    self.right.pre_order(&block) if self.right
  end

  # Implement in-order traversal of the tree
  def in_order(&block)
    self.left.in_order(&block)  if self.left
    block.call(self.value)
    self.right.in_order(&block) if self.right
  end

  # Implement post-order traversal of the tree
  def post_order(&block)
    self.right.post_order(&block) if self.right
    self.left.post_order(&block)  if self.left
    block.call(self.value)
  end
end
