class Board
    def initialize
        @board = Array.new(3) {Array.new(3, '_')}
    end

    def valid?(position)

        indices = []
        
        (0..2).each do |i1|
            (0..2).each do |i2|
                indices << [i1, i2]
            end
        end

        indices.include?(position)
    end

    def empty?(position)
        x = position[0]
        y = position[1]
        @board[x][y] == '_'
    end


    def place_mark(position, mark)
        if valid?(position) == false 
            puts "invalid position" 
        end
        if empty?(position) == false
            puts "position taken" 
        end

        if valid?(position) && empty?(position)
            x = position[0]
            y = position[1]
            @board[x][y] = mark
        end
    end

    def mark_placed?(position, mark)
        x = position[0]
        y = position[1]
        if @board[x][y] == mark
            return true
        else
            return false
        end

    end

    def print
        @board.each do |row|
            puts "|" + row.join('|') + "|"
        end
    end

    def win_row?(mark)
        @board.any? do |row|
            row.all? {|space| space == mark }
        end
    end

    def win_col?(mark)
        if @board.all? {|sub| sub[0] == mark}
            return true
        elsif @board.all? {|sub| sub[1] == mark}
            return true
        elsif @board.all? {|sub| sub[2] == mark}
            return true 
        else
            return false
        end
    end

    def win_diagonal?(mark)
        if @board[0][0] == mark && @board[1][1] == mark && @board[2][2] == mark 
            return true
        elsif @board[0][2] == mark && @board[1][1] == mark && @board[2][0] == mark
            return true
        else
            return false
        end
    end

    def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            return true
        else
            return false
        end
    end

    def empty_positions?
        @board.each do |sub|
            sub.each do |space|
                return true if space == '_'
            end
        end

        return false
    end

end








