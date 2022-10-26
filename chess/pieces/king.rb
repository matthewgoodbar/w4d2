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
end