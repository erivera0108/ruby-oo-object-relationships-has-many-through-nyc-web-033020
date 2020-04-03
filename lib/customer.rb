require 'pry'
class Customer
    attr_accessor :name, :age
    @@all = []
  def initialize(name, age)
    @name = name
    @age = age
    Customer.all << self
  end

  def new_meal(waiter, total, tip = 0)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select do |meals|
        # binding.pry
        meals.customer == self
    end
  end

  def waiters
    meals.map do  |meal|
        meal.waiter
    end
  end

  def self.all 
    @@all
  end
end