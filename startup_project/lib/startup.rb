require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees =[]
    end

    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def >(other_startup)
        self.funding>other_startup.funding
    end

    def hire(name, title)
        if !valid_title?(title)
            raise "Error: title is not valid"
        else
            @employees << Employee.new(name, title)
        end
        
    end

    def size
        employees.length
    end

    def pay_employee(employee)
        if funding >= @salaries[employee.title]
            employee.pay(@salaries[employee.title])
            @funding -= @salaries[employee.title]
        else
            raise "Error: not enough funding to pay #{employee.name}" 
        end
    end

    def payday
        @employees.each {|employee| self.pay_employee(employee)}
    end

    def average_salary
        employees.map {|employee| @salaries[employee.title]}.sum / employees.length.to_f
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        other_startup.salaries.each {|k,v| !(@salaries.keys.include?(k)) ? @salaries[k] = v : @salaries[k] = @salaries[k]}
        @employees = @employees + other_startup.employees
        other_startup.close
    end



end
