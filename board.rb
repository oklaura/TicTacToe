class Board
    def initialize
        @board = Array.new(3) {Array.new(3, '_')}
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def []=(pos, val)
        row, col = pos 
        @board[row][col] = val
    end

    def valid?(pos)
        row, col = pos

        pos.all? do |i|
            0 <= i && i < @board.length
        end
    end

    def empty?(pos)
        self[pos] == '_'
    end


    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos)
            self[pos] = mark 
        else
            puts "invalid position"
        end
    end

    def mark_placed?(pos, mark)
        row, col = pos 
        self[pos] == mark
    end

    def print
        @board.each do |row|
            puts "|" + row.join('|') + "|"
        end
        puts " "
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

    def available_pos
        arr = []
        (0...@board.length).each do |i1|
            (0...@board.length).each do |i2|
                arr << [i1, i2]
            end
        end
        arr.select {|space| empty?(space)}
    end

end








