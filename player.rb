
class Player

attr_accessor(:name, :lives, :points)

  def initialize(name)
    @name = name
    @lives = 3
    @points = 0
  end

  def gain_point
    @points += 1
  end

  def lose_lives
    @lives -= 1
  end

  def showname
    puts @name
  end
end