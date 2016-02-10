class Questions
  attr_reader(:answer)

  def initialize
    @first = rand(1..20)
    @second = rand(1..20)
    @oper = rand(1..3)

    if @oper == 1
      @answer = @first + @second
      @operator = '+'
    elsif @oper == 2
      @answer = @first - @second
      @operator = '-'
    else
      @answer = @first * @second
      @operator = '*'
    end
  end

  def to_string
    puts "What is #{@first} #{@operator} #{@second}?"
  end

  def correct?(userinput)
    if userinput == @answer
      return true
    else
      return false
    end
    
  end

end