require_relative "piece"
require "singleton"

class NullPiece < Piece
    include Singleton

    def initialize
        @color = nil
        @symbol = nil
    end

    def moves
        
    end


    attr_reader :color, :symbol
end