class Game
  @game_over = false
  @board
  @x
  @o
  @winner

  def initialize
    @x = Player.new('x')
    @o = Player.new('o')
    @board = Board.new
    @board.make_board
    @winner = ''
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
    elsif @board.space.all? { |marks| marks == 'x' || marks == 'o'}
      @game_over = true
      puts 'Looks like a tie. Better luck next time.'
    end
  end

  def declare_winner
    puts "\nThat's three in a row: Tic-Tac-Toe! Player '#{@winner}' wins!!\n"
  end

  def play_game
    until @game_over == true
      @board.update_board(@x.choose_space, 'x')
      if @board.empty_space == false
        while @board.empty_space == false
          puts @board.make_board
          @board.update_board(@x.choose_space, 'x')
        end
      end

      check_win_condition

      if @game_over == true
        @winner = @x.name
        declare_winner
        break
      end

      @board.update_board(@o.choose_space, 'o')

      if @board.empty_space == false
        while @board.empty_space == false
          puts @board.make_board
          @board.update_board(@o.choose_space, 'o')
        end
        check_win_condition
      end

      if @game_over == true
        @winner = @o.name
        declare_winner
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
    puts "\nPlayer '#{@name}', enter the number of the space you want to mark."
    @player_choice = gets.chomp.to_i
    puts "\nYou marked space '#{@player_choice}'."
    @player_choice
  end
end

class Board < Player
  attr_accessor :space, :board, :empty_space

  def initialize
    @space = (1..9).to_a
    @board = "\n| #{@space[0]} | #{@space[1]} | #{@space[2]} |\n| #{@space[3]} | #{@space[4]} | #{@space[5]} |\n| #{@space[6]} | #{@space[7]} | #{@space[8]} |\n"
  end

  def make_board
    puts @board
  end

  def update_board(input, mark)
    check_space(input)
    if @empty_space == true
      @space[input - 1] = mark
      puts @board = "\n| #{@space[0]} | #{@space[1]} | #{@space[2]} |\n| #{@space[3]} | #{@space[4]} | #{@space[5]} |\n| #{@space[6]} | #{@space[7]} | #{@space[8]} |\n"
    end
  end

  def check_space(input)
    @empty_space = true
    if @space[input - 1] == 'x' || @space[input - 1] == 'o'
      @empty_space = false
      puts "'#{space[input - 1]}' already took that spot. \nChoose another space."
    end
  end
end

game = Game.new
game.play_game
