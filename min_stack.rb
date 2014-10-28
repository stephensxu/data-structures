require_relative 'linked_list'

# Implement a "min stack" - a stack that has a contant-time
# "minimum" operations.

class MinStack < Stack
  attr_accessor :min

  def initialize
    @min = Float::INFINITY
    @list = LinkedList.new
    @size = 0
  end

  # Places +item+ on the top of the stack
  def push(item)
    new_min = [item.to_i, self.min]
    super([item, new_min])
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  def pop
    super[0]
  end

  # Return the item on the top of the stack without removing it
  def peek
    super[0]
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
    empty? ? Float::INFINITY : @list.head.value[1]
  end
end
