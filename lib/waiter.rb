class Waiter
    attr_accessor :name, :yr_exp
    @@all = []
    def initialize(name, yr_exp)
        @name = name
        @yr_exp = yr_exp
        Waiter.all << self
    end

    def new_meal(customer, total, tip = 0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meals|
            meals.waiter == self
        end
    end

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        best_tipped_meal.customer
    end

    def self.all
        @@all
    end
end

