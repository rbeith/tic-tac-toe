# module Scoring
#   def win_condition
   
#   end
# end

class Game
  @game_over = false
  @board
  @x
  @o 

  def initialize
    @x = Player.new('x')
    @o = Player.new('o')
    @board = Board.new
    @board.make_board
  end

  def play_game
    until @game_over == true
      @board.update_board(@x.choose_space, 'x')
      @board.update_board(@o.choose_space, 'o')
      if @board.space[0] == 'x' && @board.space[1] == 'x' && @board.space[2] == 'x'
        @game_over = true
        puts 'Three in a row. Tic-Tac-Toe'
      end
    end
  end
end

class Player < Game
  attr_accessor :player_choice, :name

  def initialize(name)
    @name = name
    @player_choice = ''
  end

  def choose_space
    puts "Player '#{@name}', enter a number to choose where to put your mark."
    @player_choice = gets.chomp.to_i
    puts "You chose space '#{@player_choice}'"
    @player_choice
  end
end

class Board < Player
  attr_accessor :space, :board

  def initialize
    @space = (1..9).to_a
    @board = "| #{@space[0]} | #{@space[1]} | #{@space[2]} |\n| #{@space[3]} | #{@space[4]} | #{@space[5]} |\n| #{@space[6]} | #{@space[7]} | #{@space[8]} |"
  end

  def make_board
    puts @board
  end

  def update_board(input, mark)
    @space[input - 1] = mark
    puts @board = "| #{@space[0]} | #{@space[1]} | #{@space[2]} |\n| #{@space[3]} | #{@space[4]} | #{@space[5]} |\n| #{@space[6]} | #{@space[7]} | #{@space[8]} |"
  end
end



game = Game.new
game.play_game

# Pseudocode--
#
#
