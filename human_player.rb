class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Player #{@mark}-"
        puts "Enter two numbers representing row(1-3) and column(1-3)"
        puts "in the format 'row col' i.e. 1 2"
        pos = gets.chomp.split(" ").map(&:to_i)
        raise "invalid position" if pos.length != 2
        pos
    end

end

