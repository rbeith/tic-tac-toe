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

  def check_win_condition
    if @board.space.values_at(0, 1, 2).all?('x') ||
      @board.space.values_at(0, 1, 2).all?('o') ||      
      @board.space.values_at(3, 4, 5).all?('x') ||      
      @board.space.values_at(3, 4, 5).all?('o') ||      
      @board.space.values_at(6, 7, 8).all?('x') ||      
      @board.space.values_at(6, 7, 8).all?('o') ||
      @board.space.values_at(0, 4, 8).all?('x') ||
      @board.space.values_at(0, 4, 8).all?('o') ||
      @board.space.values_at(2, 4, 6).all?('x') ||
      @board.space.values_at(2, 4, 6).all?('o') ||
      @board.space.values_at(0, 3, 6).all?('x') ||
      @board.space.values_at(0, 3, 6).all?('o') ||
      @board.space.values_at(1, 4, 7).all?('x') ||
      @board.space.values_at(1, 4, 7).all?('o') ||
      @board.space.values_at(2, 5, 8).all?('x') ||
      @board.space.values_at(2, 5, 8).all?('o')
        @game_over = true
        puts 'Three in a row. Tic-Tac-Toe'
    elsif @board.space.all? { |marks| marks == 'x' || marks == 'o'}
      @game_over = true
      puts 'Looks like a tie. Better luck next time.'
    end
  end

  def play_game
    until @game_over == true
      @board.update_board(@x.choose_space, 'x')
      check_win_condition
      if @game_over == true
        break
      end
      @board.update_board(@o.choose_space, 'o')
      check_win_condition
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
