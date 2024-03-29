require './lib/node'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class NodeTest < Minitest::Test
  def setup
    @node = Node.new("plop")
  end

  def test_attributes
    assert_equal "plop", @node.data
    assert_nil @node.next_node
  end
end
