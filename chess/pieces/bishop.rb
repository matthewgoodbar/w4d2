require_relative "piece"
require_relative "slideable"

class Bishop < Piece
    include Slideable
    attr_reader :position, :board, :color
    def initialize(board, position, color)
        super
    end

    def to_s
        return self.color_piece("Bi")
    end

    private
    def diag?
        true
    end

    def horiz?
        false
    end
end