class Node
  attr_accessor :value, :next

  def initialize(value)
    @value = value
    @next = nil
  end
end

class LinkedList
  attr_accessor :head

  def initialize(node = nil)
    @head = node
  end

  def add(node)
    #add a new node to the list
    current_node = @head
    while current_node.next
      current_node = current_node.next
    end
    current_node.next = node
  end

  def print
    #prints the entire list
    current_node = @head
    puts 'Node Value: ' + current_node.value.to_s
    puts 'Next Node: ' + current_node.next.to_s
    while current_node.next
      current_node = current_node.next
      puts 'Node Value: ' + current_node.value.to_s
      puts 'Next Node: ' + current_node.next.to_s
    end
  end

  def pop
    current_node = @head
    while current_node.next
      previous_node = current_node
      current_node = current_node.next
    end
    previous_node.next = nil
  end

  def splice(num)
    current_node = @head
    previous_node = current_node
    if num == 1
      @head = current_node.next
    else
      (num-1).times {
        previous_node = current_node
        current_node = current_node.next
      }
      previous_node.next = current_node.next
    end
  end
end

first = Node.new(1)
second = Node.new(2)
third = Node.new(3)
fourth = Node.new(4)
fifth = Node.new(5)

list = LinkedList.new(first)
list.add(second)
list.add(third)
list.add(fourth)
list.add(fifth)
list.print
puts "==================================="
list.splice(5)
list.print