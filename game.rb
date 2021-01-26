require_relative "./board.rb"
require_relative "./human_player.rb"
require_relative "./computer_player.rb"

class Game

    def initialize(mark_1, mark_2)
        @player1 = HumanPlayer.new(mark_1)
        @player2 = ComputerPlayer.new(mark_2)
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
        puts "LET'S PLAY"
        puts "- TIC TAC TOE -"
        puts
        while @board.empty_positions?
            @board.print 
            position = @current_player.get_position(@board.available_pos)
            @board.place_mark(position, @current_player.mark)

            if @board.win?(@current_player.mark)
                @board.print
                if @current_player.is_a?(ComputerPlayer)
                puts "Game Over - You Lose :("
                else
                puts "Game Over - You Win!"
                end
                return
            else
                self.switch_turn if @board.mark_placed?(position, @current_player.mark)
            end
        end

        @board.print
        puts "Game Over - DRAW"

    end

end

game = Game.new(:X, :O)
game.play



