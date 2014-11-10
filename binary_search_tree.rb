require_relative 'binary_tree'

# Implement a binary search tree.
# See http://en.wikipedia.org/wiki/Binary_search_tree
# Operations to support:
#   include?(value)     Average O(log n) time
#   insert(value)       Average O(log n) time
#   remove(value)       Average O(log n) time
#   empty?              O(1) time

class BinarySearchTree < BinaryTree
  attr_reader :parent, :left, :right, :value

  def initialize(value, parent=nil)
    super(value)
    @parent = parent
  end

  def insert(value)
    if value > self.value
      self.right ? self.right.insert(value) : self.right = BinarySearchTree.new(value, self)
    else
      self.left ? self.left.insert(value) : self.left = BinarySearchTree.new(value, self)
    end
  end

  def include?(value)
    return true if self.value == value
    if value > self.value
      self.right ? self.right.include?(value) : false
    else
      self.left ? self.left.include?(value) : false
    end
  end

  def find(value)
    return self if self.value == value
    if value > self.value
      self.right ? self.right.find(value) : nil
    else
      self.left ? self.left.find(value) : nil
    end
  end

  def remove(value)
    node = self.find(value)
    (node.parent.left = nil && node.parent.right = nil) if (node.left == nil && node.right == nil) 
    node.parent.left = node.left if node.left && !node.right
    node.parent.right = node.right if node.right && !node.left
    node
  end

  def empty?
  end
end
