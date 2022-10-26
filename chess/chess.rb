require_relative 'board'
# require_relative ''

class Chess
    attr_reader :board, :cursor, :display, :player1, :player2
    attr_accessor :current_player
    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], @board)
        @player1 = Player.new(:w, @cursor)
        @player2 = Player.new(:b, @cursor)
        @display = Display.new(@board, @cursor)
        @current_player = @player1
    end

    
end