require_relative "slideable"
require_relative "stepable"

class Piece
    def initialize(board, position, color)
        @board = board
        @position = position
        @color = color
    end

    def valid_moves
        possible_moves = []
    end
end