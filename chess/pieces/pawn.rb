require_relative "piece"

class Pawn < Piece
    attr_reader :position, :board, :color
    def initialize(board, position, color)
        super
    end

    def to_s
        return "Pn"
    end
end