require_relative "piece"

class Rook < Piece
    include Slideable
    attr_reader :position, :board, :color
    def initialize(board, position, color)
        super
    end

    def to_s
        return "Rk"
    end

    private
    def diag?
        false
    end

    def horiz?
        true
    end

end