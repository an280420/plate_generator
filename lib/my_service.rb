class MyService
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  def i_am
    puts "я есть  представитель классa MyServise, мое имя #{@name}, мой возраст #{@age} "
  end
end
