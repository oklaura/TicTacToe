class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(arr)
        pos = nil
        until arr.include?(pos)
        puts "Player #{@mark}-"
        puts "Enter two numbers representing row(0-2) and column(0-2)"
        puts "in the format 'row col' i.e. 1 2"
        pos = gets.chomp.split(" ").map(&:to_i)
        if !arr.include?(pos)
            puts
            puts "-- Error: Invalid position, try again --"
            puts
        end
        end
        pos
    end

end

