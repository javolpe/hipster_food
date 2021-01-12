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
    
  end


end