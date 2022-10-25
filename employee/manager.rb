require_relative "employee"

class Manager < Employee
    attr_accessor :employees
    def initialize(name, title, salary, boss=nil)
        @employees = []
        super
    end

    protected
    def get_bonus_base
        sum = 0
        employees.each do |employee| 
            sum += employee.get_bonus_base
        end
        return sum
    end
end