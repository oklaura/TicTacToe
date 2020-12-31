require_relative "./board.rb"
require_relative "./human_player.rb"

class Game

    def initialize(mark_1, mark_2)
        @player1 = HumanPlayer.new(mark_1)
        @player2 = HumanPlayer.new(mark_2)
        @board = Board.new
        @current_player = @player1
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def play
        while @board.empty_positions?
            @board.print 
            position = @current_player.get_position
            @board.place_mark(position, @current_player.mark)

            if @board.win?(@current_player.mark)
                puts "Game Over - #{@current_player.mark} wins!"
                return
            else
                self.switch_turn
            end
        end

        puts "Game Over - DRAW"

    end

end

game = Game.new(:X, :O)
game.play



