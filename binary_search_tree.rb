require_relative 'binary_tree'

# Implement a binary search tree.
# See http://en.wikipedia.org/wiki/Binary_search_tree
# Operations to support:
#   include?(value)     Average O(log n) time
#   insert(value)       Average O(log n) time
#   remove(value)       Average O(log n) time
#   empty?              O(1) time

class BinarySearchTree < BinaryTree

  def initialize(value)
    super(value)
  end

  def insert(value)
    if value > self.value
      self.right ? self.right.insert(value) : self.right = BinarySearchTree.new(value)
    else
      self.left ? self.left.insert(value) : self.left = BinarySearchTree.new(value)
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

  def remove(value)
  end

  def empty?
  end
end
