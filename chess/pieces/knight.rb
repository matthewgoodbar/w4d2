require_relative "piece"

class Knight < Piece
    include Stepable
    attr_reader :position, :board, :color
    def initialize(board, position, color)
        super
    end
end