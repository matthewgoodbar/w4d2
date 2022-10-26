require 'colorize'

class Piece
    attr_reader :position, :board, :color
    
    def initialize(board, position, color)
        @board = board
        @position = position
        @color = color
    end

    def valid_moves
        possible_moves = []
    end

    def to_s
        return "no"
    end

    def opposite_color
        if self.color == :w
            return :b
        elsif self.color == :b
            return :w
        else
            return nil
        end
    end

    def color_piece(str)
        if self.color == :w
            return str.colorize(:black).colorize(:background => :white)
        elsif self.color == :b
            return str.colorize(:white).colorize(:background => :black)
        else
            return str
        end
    end
end