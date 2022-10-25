require_relative "piece"

class Rook < Piece
    include Slideable
    attr_reader :position, :board, :color
    def initialize(board, position, color)
        super
    end

    private
    def diag?
        false
    end

    def horiz?
        true
    end
end