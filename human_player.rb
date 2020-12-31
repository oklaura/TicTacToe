class HumanPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Player #{@mark}-"
        puts "Enter two numbers representing row(1-3) and column(1-3)"
        puts "in the format 'row col' i.e. 1 2"
        position = gets.chomp.split(" ")
        position.map! {|num| num.to_i - 1}
        raise "invalid position" if position.length != 2
        position
    end

end

