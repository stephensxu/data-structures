require_relative 'linked_list'
require_relative 'stack'

# Implement a "min stack" - a stack that has a contant-time
# "minimum" operations.

class MinStack < Stack

  attr_accessor :min_value, :list

  def initialize
    @min_value = Float::INFINITY
    @list = LinkedList.new
    @size = 0
  end

  # Places +item+ on the top of the stack
  def push(item)
    @min_value = [item.value.to_i, self.min_value].min
    @list.unshift([item, @min_value])
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  def pop
    super[0]
  end

  # Return the item on the top of the stack without removing it
  def peek
    @list.head.value[0].value
  end

  # Return true if the stack is empty and false otherwise
  def empty?
    super
  end

  # Return the number of items on the stack
  def size
    super
  end

  # Returns the smallest item on the stack
  # O(1) time
  def min
    empty? ? -Float::INFINITY : @list.head.value[1]
  end
end

a = MinStack.new
p a.min
a.push(Node(1))
a.push(Node(2))
a.push(Node(-1))
a.push(Node(-10))
a.push(Node(8))
a.list.each { |item| p item }
p a.peek
p a.min
a.pop
p a.peek
p a.min
