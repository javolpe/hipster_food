class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
     @name = name
     @food_trucks = []
  end

  def add_food_truck(truck)
    food_trucks << truck
  end

  def food_truck_names 
    food_trucks.map{|truck| truck.name}
  end

  def food_trucks_that_sell(item)
    food_trucks.find_all{|truck| truck.inventory.keys.include?(item)}
  end

  def total_quantity(item)
    @food_trucks.reduce(0) do |memo, truck|
      if truck.inventory.keys.include?(item)
       memo += truck.inventory[item]
      end
    else
      memo
    end
  end

  def trucks_selling_item(item)
    @food_trucks.reduce([]) do |memo, truck|
      if truck.inventory.keys.include?(item)
        memo << truck
      else 
        memo
      end
    end
  end

  def all_items
    array = @food_trucks.flat_map{|truck| truck.inventory.keys}
    array = array.uniq
  end

  def total_inventory
    items = all_items
    inventory_hash = {}
    items.map do |item|
      inventory_hash[item] = {quantity: total_quantity(item), 
                              food_trucks: trucks_selling_item(item)} 
    end
    inventory_hash
  end

  def overstocked_items
    items = all_items
    items.find_all do |item|
      total_quantity(item) > 50 && trucks_selling_item(item).count > 1
    end
  end


end