require_relative 'board'
require_relative 'display'
require_relative 'player'
require_relative 'cursor'
require 'byebug'

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
        if self.current_player == self.player1
            self.current_player = self.player2
        else 
            self.current_player = self.player1
        end
    end
    
    def play
        until self.board.checkmate?
            player_move
            switch_player
        end
    end

    def player_move
        begin
            move = []
            while move.length < 2
                system("clear") || system("cls")
                self.display.render(self.current_player)
                user_input = self.current_player.get_input
                move << user_input unless user_input.nil?
            end
            raise 'That\'s not your piece!' unless self.board[move[0]].color == self.current_player.color
            self.board.move_piece(move[0], move[1])
            return
        rescue
            puts "That was not a valid move, please try again."
            gets
            retry
        end
    end

end

# debugger
Chess.new.play