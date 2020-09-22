class Employee 
    attr_reader :name, :salary , :title , :boss
    def initialize(name, salary, title, boss=nil)
        @name = name 
        @salary = salary
        @title = title 
        @boss = boss
    end

    def bonus(multiplier)
        self.salary * multiplier
    end

    def boss=(new_boss)
        @boss = new_boss
    end
end