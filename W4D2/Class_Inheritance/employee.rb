class Employee

  attr_reader :name, :salary, :boss, :title

  def initialize(name, salary, title, boss)
    @name = name
    @salary = salary
    @title = title
    @boss = boss
  end

  def bonus(multiplier)
    self.salary * multiplier
    
  end

end