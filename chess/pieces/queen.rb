require_relative "piece"

class Queen < Piece
    include Slideable
    attr_reader :position, :board, :color
    def initialize(board, position, color)
        super
    end
    
    def to_s
        return "Qn"
    end
    private
    def diag?
        true
    end

    def horiz?
        true
    end


end