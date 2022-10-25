require_relative "piece"
require "singleton"

class NullPiece < Piece
    include Singleton
    attr_reader :color

    def initialize
        @color = nil
    end

    def to_s
        return "  "
    end
end