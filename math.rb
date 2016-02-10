require 'colorize'
require 'pry'

require_relative 'player'
require_relative 'questions'

#binding.pry

class MathGame 
    @repl = true
    @turn = 0
    
    puts "Welcome to Math Lord. We will find out who the Math Lord is!"
    puts "------------------------------------------------------------"
    print "p1 name: "
    @username = gets.chomp
    p1 = Player.new(@username)
    p1.name = p1.name.colorize(:blue)
    puts "Welcome #{p1.name}! Who is your opponent?"
    print "p2 name: "
    @username = gets.chomp
    p2 = Player.new(@username)
    p2.name = p2.name.colorize(:blue)
    puts "Welcome #{p2.name}! It's time to face off against #{p1.name}!"
  
    
    while @repl

      question = Questions.new

      if @turn == 0
        print "#{p1.name}'s turn: "
      else
        print "#{p2.name}'s turn: "
      end
    
      print question.to_string
      @userinput = gets.chomp.to_i 



      if @turn == 0 && question.correct?(@userinput) 
        puts "You are right!".colorize(:green)
        p1.points += 1
        @turn += 1
      elsif @turn == 0 && !question.correct?(@userinput) 
        puts "You are wrong! You lost a life".colorize(:red)
        p1.lives -= 1
        @turn += 1
      elsif @turn == 1 && question.correct?(@userinput) 
        puts "You are right!".colorize(:green)
        p2.points += 1
        @turn = 0
      elsif @turn == 1 && !question.correct?(@userinput) 
        puts "You are wrong! You lost a life".colorize(:red)
        p2.lives -= 1
        @turn = 0
      end

      puts
      puts
      puts "Recap time!"
      puts "The leaderboard is:
           #{p1.name} has #{p1.points}points and #{p1.lives}lives.
           #{p2.name} has #{p2.points}points and #{p2.lives}lives."
      puts
      puts

      if p1.lives == 0 || p2.lives == 0
        puts "MATH LORD IS OVER!"
        if p1.lives > p2.lives
          puts "#{p1.name} is the MATH LORD!".colorize(:green)
        elsif p2.lives > p1.lives
          puts "#{p2.name} is the MATH LORD!".colorize(:green)
        end

        puts "Final score is:
              #{p1.name}: #{p1.points} point(s) and has #{p1.lives} lives remaining!
              #{p2.name}: #{p2.points} point(s) and has #{p2.lives} lives remaining!"

        puts
        puts "Would you like to play again? Y/N".colorize(:magenta)
        @prompt = gets.chomp.upcase
        if @prompt == 'Y'
          p1.lives = 3
          p2.lives = 3
          p1.points = 0
          p2.points = 0
        else
          puts "Good bye!"
          @repl = false
        end
      end
   end
end
#pseudo code for logic
# initialize player name and lives
# greet players (names in array maybe)
# players take turns answering math question if they answer wrong they lose a life
# game continues until one players loses all their lives
# when someone loses a life display the score(number of points) and lives left



