require_relative 'linked_list'

# Implement a Stack class using a linked list

class Stack
  attr_reader :list

  class UnderflowError < StandardError; end

  def initialize
    @list = LinkedList.new
    @size = 0
  end

  # Places +item+ on the top of the stack
  # O(1) time
  def push(item)
    @list.unshift(item)
    @size += 1
  end

  # Removes the item on the top of the stack and returns it.
  # Raises an error if the stack is empty (called a "stack underflow")
  # O(1) time
  def pop
    raise UnderflowError, "Stack is empty" if empty?
    @size -= 1
    @list.shift
  end

  # Return the item on the top of the stack without removing it
  # O(1) time
  def peek
    @list.head.value
  end

  # Return true if the stack is empty and false otherwise
  # O(1) time
  def empty?
    @list.empty?
  end

  # Return the number of items on the stack
  # O(1) time
  def size
    @size
  end
end
