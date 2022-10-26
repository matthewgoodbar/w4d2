require_relative "piece"
require_relative "stepable"

class Knight < Piece
    include Stepable
    
    def initialize(board, position, color)
        super
    end

    def to_s
        return self.color_piece("Kn")
    end

    private
    def move_difs
        [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[-1,2],[1,-2],[-1,-2]]
    end
end