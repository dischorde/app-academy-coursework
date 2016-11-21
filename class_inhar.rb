class Employee
  attr_reader :salary

  def initialize(name, title, salary)
    @name = name
    @title = title
    @salary = salary
    @boss = nil
  end

  def bonus(multiplier)
    @salary * multiplier
  end

  def add_boss(boss)
    @boss = boss
    @boss.subordinates << self
  end

end

class Manager < Employee
  attr_reader :subordinates

  def initialize(name, title, salary)
    super(name, title, salary)
    @subordinates = []
  end

  def bonus(multiplier)
    subordinates_sal * multiplier
  end

  def subordinates_sal
    sum = 0
    @subordinates.each do |employee|
      sum += employee.salary
      sum += employee.subordinates_sal if employee.is_a?(Manager)
    end
    sum
  end

end
darren = Manager.new("Darren", "TA Manager", 78000)
ned = Manager.new("Ned", "Founder", 1000000)
darren.add_boss(ned)
shawna = Employee.new("Shawna", "TA", 12000)
shawna.add_boss(darren)

david = Employee.new("David", "TA", 10000)
david.add_boss(darren)


p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)
