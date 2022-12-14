require_relative "piece"
require_relative "stepable"

class King < Piece
    include Stepable
    
    def initialize(board, position, color)
        super
    end

    def to_s
        return self.color_piece("Ki")
    end

    private
    def move_difs
        [[1,0],[-1,0],[0,1],[0,-1],[1,1],[-1,1],[1,-1],[-1,-1]]
    end
end