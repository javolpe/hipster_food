require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/item'

class ItemTest < Minitest::Test
  def test_it_exists_and_has_attributes
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    assert_instance_of Item, item1
    assert_equal 3.75, item1.price
    assert_equal Float, item1.price.class
    assert_equal "Peach Pie (Slice)", item1.name
    assert_equal String, item1.name.class
  end
end