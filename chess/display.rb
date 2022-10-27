require_relative "board"
require_relative "cursor"

class Display
    attr_reader :board, :cursor

    def initialize(board, cursor)
        @board = board
        @cursor = cursor
    end

    def render(current_player)
        print "   0 1 2 3 4 5 6 7"
        puts
        (0...8).each do |row|
            print "#{row} "
            (0...8).each do |col|
                if [row,col] == @cursor.cursor_pos
                    print "#{self.board[[row,col]].to_s}".colorize(:background => current_player.get_cursor_color)
                else
                    print "#{self.board[[row,col]].to_s}"
                end
            end
            puts
        end
        nil
    end

    # def test_play
    #     res = []
    #     while true
    #         system("clear") || system("cls")
    #         render
    #         user_input = self.cursor.get_input
    #         res << user_input unless user_input.nil?
    #         if res.length == 2
    #             self.board.move_piece(res[0], res[1])
    #             res = []
    #         end
    #     end
    # end

end