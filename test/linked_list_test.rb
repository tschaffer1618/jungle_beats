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
    assert_equal "There are no nodes in the linked list", @list.to_string

    @list.append("doop")

    assert_instance_of Node, @list.head

    node = @list.head

    assert_equal "doop", node.data
    assert_nil node.next_node
    assert_equal 1, @list.count
    assert_equal "doop", @list.to_string
  end

  def test_append_multiple
    @list.append("doop")
    @list.append("deep")

    assert_instance_of Node, @list.head

    head_node = @list.head

    assert_equal "doop", head_node.data
    assert_instance_of Node, head_node.next_node

    node_2 = head_node.next_node

    assert_equal "deep", node_2.data
    assert_equal 2, @list.count
    assert_equal "doop deep", @list.to_string

    @list.append("erp")
    @list.append("doop")

    assert_equal 4, @list.count
    assert_equal "doop deep erp doop", @list.to_string
  end

  def test_find_last_node
    assert_equal "There are no nodes in the linked list", @list.find_last_node

    @list.append("doop")

    assert_equal "doop", @list.find_last_node.data

    @list.append("deep")
    @list.append("erp")

    assert_equal "erp", @list.find_last_node.data
  end

  def test_prepend
    @list.append("plop")
    @list.append("suu")
    @list.prepend("dop")

    assert_equal "dop", @list.head.data
    assert_equal "dop plop suu", @list.to_string
    assert_equal 3, @list.count
  end

  def test_insert
    @list.append("plop")
    @list.append("suu")
    @list.prepend("dop")
    @list.insert(1, "woo")

    assert_equal "dop", @list.head.data
    assert_equal "dop woo plop suu", @list.to_string
    assert_equal 4, @list.count

    @list.insert(0, "wop")

    assert_equal "wop", @list.head.data
    assert_equal "wop dop woo plop suu", @list.to_string
    assert_equal 5, @list.count

    response = "The linked list doesn't have enough nodes to insert at position 7"

    assert_equal response, @list.insert(7, "doop")
    assert_equal "wop dop woo plop suu", @list.to_string

    @list.insert(6, "doop")
    assert_equal "wop dop woo plop suu doop", @list.to_string
    assert_equal 6, @list.count
  end

  def test_find
    @list.prepend("shi")
    @list.append("shu")
    @list.prepend("deep")
    @list.insert(1, "woo")
    @list.append("blop")

    assert_equal "deep woo shi shu blop", @list.to_string

    assert_equal "shi", @list.find(2, 1)
    assert_equal "woo shi shu", @list.find(1, 3)
    assert_equal "The linked list doesn't have enough nodes to satisfy this search", @list.find(4, 4)
    assert_equal "deep woo shi shu blop", @list.find(0, 5)
  end

  def test_includes
    @list.prepend("shi")
    @list.append("shu")
    @list.prepend("deep")
    @list.insert(1, "woo")
    @list.append("blop")

    assert @list.includes?("deep")
    refute @list.includes?("dep")
  end

  def test_find_second_last_node
    assert_equal "There is not a second to last node in the linked list", @list.find_second_last_node

    @list.prepend("shi")

    assert_equal "There is not a second to last node in the linked list", @list.find_second_last_node

    @list.append("shu")

    assert_equal "shi", @list.find_second_last_node.data
  end

  def test_pop
    @list.prepend("shi")
    @list.append("shu")
    @list.prepend("deep")
    @list.insert(1, "woo")
    @list.append("blop")

    assert_equal "blop", @list.pop
    assert_equal "deep woo shi shu", @list.to_string
    assert_equal "shu", @list.pop
    assert_equal "deep woo shi", @list.to_string

    @list.pop
    @list.pop

    assert_equal "deep", @list.to_string

    assert_equal "deep", @list.pop
    assert_nil @list.head

    assert_equal "There are no nodes in the linked list", @list.pop
  end
end
