require_relative "piece"

class King < Piece
    include Stepable
    attr_reader :position, :board, :color
    def initialize(board, position, color)
        super
    end
end