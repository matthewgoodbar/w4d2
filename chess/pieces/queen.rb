require_relative "piece"

class Queen < Piece
    include Slideable

    private
    def diag?
        true
    end

    def horiz?
        true
    end
end