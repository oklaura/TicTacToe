class ComputerPlayer

    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(arr)
        choice = arr.sample
        puts "Computer plays #{self.mark} at #{choice}"
        puts 
        choice
    end

end