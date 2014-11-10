require_relative 'binary_tree'

# Implement a binary search tree.
# See http://en.wikipedia.org/wiki/Binary_search_tree
# Operations to support:
#   include?(value)     Average O(log n) time
#   insert(value)       Average O(log n) time
#   remove(value)       Average O(log n) time
#   empty?              O(1) time

class BinarySearchTree < BinaryTree
  attr_accessor :parent, :left, :right, :value

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
    if (node.left == nil && node.right == nil)
      p "leaf node being removed..."
      p "node.parent.value is #{node.parent.value}..."
      node.parent.left = nil
      node.parent.right = nil
      p "node.parent.left is #{node.parent.left}, node.parent.right is #{node.parent.left}"
    elsif node.left && !node.right
      p "left node being removed..."
      node.parent.left = node.left
    elsif node.right && !node.left
      p "right node being removed..."
      node.parent.right = node.right
    end
  end

  def empty?
  end
end

### Test script

tree = BinarySearchTree.new(5)
tree.insert(3)
tree.insert(8)
tree.insert(2)
tree.insert(1)
tree.insert(9)
tree.insert(7)
tree.insert(10)
tree.remove(2)
tree.remove(9)
p tree.value == 5 #==> true
p tree.left.left.value == 1 #==> true
p tree.right.right.value == 10 #==> true
tree.remove(10)
tree.remove(1)
p tree.left.left == nil #==> false
p tree.left.value
p tree.right.value
p tree.right.left.value
p tree.right.right.value
p tree.right.right == nil #==> false
