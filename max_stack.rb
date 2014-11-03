require_relative 'linked_list'
require_relative 'stack'

# Implement a "max stack" - a stack that has a contant-time
# "maximum" operations.

class MaxStack < Stack

  attr_accessor :max_value, :list

  def initialize
    @max_value = -Float::INFINITY
    @list = LinkedList.new
    @size = 0
  end

  # Places +item+ on the top of the stack
  def push(item)
    @max_value = [item, self.max_value].max
    super([item, @max_value])
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  def pop
    super[0]
  end

  # Return the item on the top of the stack without removing it
  def peek
    @list.head.value[0]
  end

  # Return true if the stack is empty and false otherwise
  def empty?
    super
  end

  # Return the number of items on the stack
  def size
    super
  end

  # Returns the largest item on the stack
  # O(1) time
  def max
    empty? ? Float::INFINITY : @list.head.value[1]
  end
end
