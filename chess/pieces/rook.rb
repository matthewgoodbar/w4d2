require_relative "piece"
require_relative "slideable"

class Rook < Piece
    include Slideable
    attr_reader :position, :board, :color
    def initialize(board, position, color)
        super
    end

    def to_s
        return self.color_piece("Rk")
    end

    private
    def diag?
        false
    end

    def horiz?
        true
    end

end