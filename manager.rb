require_relative "employee.rb"
require "byebug"

class Manager < Employee 
    def initialize(name, salary, title, boss=nil)
        super
        @subordinates = [] 
    end

    def add_subordinates(employee)
        @subordinates << employee
        if employee.is_a?(Manager)
            employee.subordinates.each do |employee|
                self.subordinates << employee
            end
        end
        subordinates
    end 
    
    def bonus(multiplier)
        total_salary * multiplier
    end

    def total_salary
        total = 0
        @subordinates.each { |employee| total += employee.salary }
        total 
    end
    attr_reader :subordinates
end 

ned = Manager.new("ned", 1000000 , "founder")
darren = Manager.new("darren", 88000 , "manager", ned)
david = Employee.new("david", 10000, "TA", darren)
shawna = Employee.new("shawna", 12000, "TA", darren)
darren.add_subordinates(david) 
darren.add_subordinates(shawna)
ned.add_subordinates(darren)
p david.bonus(3)
p darren.bonus(4)
# debugger
p ned.bonus(5)