require_relative "piece"
require_relative "stepable"

class King < Piece
    include Stepable
    attr_reader :position, :board, :color
    def initialize(board, position, color)
        super
    end

    def to_s
        return "Ki"
    end

    private
    def move_difs
        [[1,0],[-1,0],[0,1],[0,-1],[1,1],[-1,1],[1,-1],[-1,-1]]
    end
end