require './lib/jungle_beat'
require './lib/linked_list'
require './lib/node'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'

class JungleBeatTest < Minitest::Test
  def setup
    @jb = JungleBeat.new
  end

  def test_attributes
    assert_instance_of LinkedList, @jb.list
    assert_nil @jb.list.head
  end

  def test_append
    @jb.append("deep doo ditt")

    assert_equal "deep", @jb.list.head.data
    assert_equal "doo", @jb.list.head.next_node.data
    assert_equal 3, @jb.list.count

    @jb.append("woo hoo shu")

    assert_equal "deep doo ditt woo hoo shu", @jb.list.to_string
    assert_equal 6, @jb.list.count
  end
end
