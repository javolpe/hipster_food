class FoodTruck
  attr_reader :name

  attr_accessor :inventory

  def initialize(name)
     @name = name
     @inventory = {}
  end

  def stock(item, stock)
    if !inventory.keys.include?(item)
      inventory[item] = stock
    else 
      inventory[item] += stock
    end
  end

  def check_stock(item)
    if inventory.keys.include?(item)
      inventory[item]
    else 
      0
    end
  end

  def potential_revenue
    inventory.reduce(0) do |memo, item|
      memo + (item[0].price * item[1]) 
    end
  end



end