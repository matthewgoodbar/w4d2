require_relative "piece"
require_relative "slideable"

class Queen < Piece
    include Slideable
    
    def initialize(board, position, color)
        super
    end

    def to_s
        return self.color_piece("Qn")
    end
    private
    def diag?
        true
    end

    def horiz?
        true
    end


end