require_relative "board"
require_relative "cursor"

class Display
    attr_reader :board, :cursor

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], board)
    end

    def render
        print "   0 1 2 3 4 5 6 7"
        puts
        (0...8).each do |row|
            print "#{row} "
            (0...8).each do |col|
                if [row,col] == @cursor.cursor_pos
                    print "#{self.board[[row,col]].to_s}".colorize(:background => :yellow)
                else
                    print "#{self.board[[row,col]].to_s}"
                end
            end
            puts
        end
        nil
    end
end

b = Board.new
disp = Display.new(b)
disp.render
disp.cursor.get_input