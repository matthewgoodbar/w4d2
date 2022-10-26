require_relative 'board'
require_relative 'display'
require_relative 'player'
require_relative 'cursor'

class Chess
    attr_reader :board, :cursor, :display, :player1, :player2
    attr_accessor :current_player
    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], @board)
        @player1 = Player.new(:w, @cursor, 1)
        @player2 = Player.new(:b, @cursor, 2)
        @display = Display.new(@board, @cursor)
        @current_player = @player1
    end

    def switch_player
        if current_player == player1
            current_player = player2
        else current_player = player1
        end
    end
    
    def play
        res = []
        while true
            system("clear") || system("cls")
            render(self.current_player)
            user_input = self.player.get_input
            res << user_input unless user_input.nil?
            if res.length == 2
                self.board.move_piece(res[0], res[1])
                res = []
                switch_player
            end
        end
    end

    def player_move
        begin
            move = []
            while move.length < 2
                user_input = self.player.get_input
                move << user_input unless user_input.nil?
            end
            
        rescue

        end
    end

end