require_relative "piece"

class Pawn < Piece
    attr_reader :position, :board, :color
    def initialize(board, position, color)
        super
    end

    def to_s
        return self.color_piece("Pn")
    end

    def moves

    end

    private
    def at_start_row?
        self.color == :w && self.position[0] == 1 || self.color == :b && self.position[0] == 6
    end

    def forward_dir
        if self.color == :w
            return [-1,0]
        else
            return [1,0]
        end
    end
end