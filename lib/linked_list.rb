class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(beat)
    if @head
      find_last_node.next_node = Node.new(beat)
    else
      @head = Node.new(beat)
    end
  end

  def prepend(beat)
    if @head
      old_head = @head
      @head = Node.new(beat)
      @head.next_node = old_head
    else
      @head = Node.new(beat)
    end
  end

  def insert(position, beat)
    if position == 0
      prepend(beat)
    elsif position > count + 1
      "The linked list doesn't have enough nodes to insert at position #{position}"
    elsif position == count + 1
      append(beat)
    else
      node = @head
      position.times do |i|
        if i != position - 1
          node = node.next_node
        else
          old_next_node = node.next_node
          new_node = Node.new(beat)
          node.next_node = new_node
          new_node.next_node = old_next_node
        end
      end
    end
  end

  def find_last_node
    return @head unless @head.next_node
    node = @head
    return node unless node.next_node while node = node.next_node
  end

  def count
    count = 0
    if !(@head)
      return count
    else
      count += 1
      node = @head
      while node = node.next_node
        count += 1
      end
    end
    count
  end

  def to_string
    string = ""
    node = @head
    string += node.data
    while node = node.next_node
      string += " " + node.data
    end
    string
  end
end
