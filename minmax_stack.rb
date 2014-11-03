require_relative 'linked_list'
require_relative 'stack'

# Implement a "min-max stack" - a stack that has contant-time
# "maximum" _and_ "minimum" operations.


class MinMaxStack < Stack

  attr_accessor :min_value, :max_value, :list

  def initialize
    @min_value = Float::INFINITY
    @max_value = -Float::INFINITY
    @list = LinkedList.new
    @size = 0
  end

  # Places +item+ on the top of the stack
  def push(item)
    @min_value = [item, self.min_value].min
    @max_value = [item, self.max_value].max
    super([item, @min_value, @max_value])
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

  # Returns the smallest item on the stack
  def min
    empty? ? -Float::INFINITY : @list.head.value[1]
  end

  # Returns the largest item on the stack
  # O(1) time
  def max
    empty? ? -Float::INFINITY : @list.head.value[2]
  end
end
