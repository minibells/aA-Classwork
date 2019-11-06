require_relative "employee.rb"

class Manager < Employee
  attr_accessor :employees, :salary

  def initialize(name, salary, title, boss)
    super
    @employees = []
  end

  def bonus(multiplier)
    sum = 0
    employees.each do |manager|
      sum += manager.salary
      manager.employees.each do |employee|
        sum += employee.salary
      end
    end
    
    sum * multiplier
  end

end



ned = Manager.new("Ned", 1000000, "Founder", nil)
darren = Manager.new("Darren", 78000, "TA Manager", ned)
david = Employee.new("David", 10000, "TA", darren)
shawna = Employee.new("Shawna", 12000, "TA", darren)

darren.employees << shawna
darren.employees << david
ned.employees << darren

p darren.employees
p ned.bonus(5)


