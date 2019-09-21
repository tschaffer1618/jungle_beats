require './lib/linked_list'
require './lib/node'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class LinkedListTest < Minitest::Test
  def setup
    @list = LinkedList.new
  end

  def test_attributes
    assert_nil @list.head
  end

  def test_append
    @list.append("doop")

    assert_instance_of Node, @list.head

    node = @list.head

    assert_equal "doop", node.data
    assert_nil node.next_node
    assert_equal 1, @list.count
    assert_equal "doop", @list.to_string
  end

end
