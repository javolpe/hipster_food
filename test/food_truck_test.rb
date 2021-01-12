require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/item'
require './lib/food_truck'

class FoodTruckTest < Minitest::Test
  def test_it_exists_and_has_attributes
    food_truck = FoodTruck.new("Rocky Mountain Pies")

    assert_instance_of FoodTruck, food_truck
    assert_equal "Rocky Mountain Pies", food_truck.name
  end
end