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
    # if self.left.value == value
    #   if self.left.left && !self.left.right
    #     self.left = self.left.left
    #   elsif self.left.right && !self.left.left
    #     self.left = self.left.right
    #   end
    # elsif self.right.value == value
    #   if self.right.left && !self.right.right
    #     self.right = self.right.left
    #   elsif self.right.right && !self.right.left
    #     self.right = self.right.right
    #   end
    # end
    node = self.find(value)
    if node.value == value
      if node.left && !node.right

      end
    end

  end

  def empty?
  end
end

test = BinarySearchTree.new(5)
test.insert(3)
test.insert(8)
test.insert(2)
test.insert(1)
test.insert(9)
test.insert(10)
# p test
p test.find(1).parent.value
