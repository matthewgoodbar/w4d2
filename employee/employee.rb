class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        get_bonus_base * multiplier
    end

    protected
    def get_bonus_base
        salary
    end
end