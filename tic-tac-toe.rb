
# class Game 
    
# end

class Player
    attr_accessor :player_choice
    
    def initialize(xo)
        @xo = xo
        @player_choice = ''
    end
    
    def player_choice
        puts "Player '#{@xo}', enter a number to choose where to put your mark."
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
    
    def update_board(input)
        @space[input - 1] = 'x'
        puts @board = "| #{@space[0]} | #{@space[1]} | #{@space[2]} |\n| #{@space[3]} | #{@space[4]} | #{@space[5]} |\n| #{@space[6]} | #{@space[7]} | #{@space[8]} |"
    end
end

x = Player.new('x')
o = Player.new('o')
board = Board.new
board.make_board
board.update_board(x.player_choice)
board.update_board(o.player_choice)


# Pseudocode--
#
#