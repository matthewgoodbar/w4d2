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

    def test_play
        user_input = nil
        until user_input == 0
            system("clear") || system("cls")
            render
            puts self.cursor.cursor_pos
            user_input = self.cursor.get_input
        end
    end

end

b = Board.new
disp = Display.new(b)
disp.test_play