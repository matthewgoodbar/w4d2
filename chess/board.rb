require_relative "required"

class Board
    
    def self.valid_position?(pos)
        pos.all? {|num| num < 8 && num >= 0}
    end

    def initialize
        @board = Array.new(8) {Array.new}
        populate
    end

    def populate
        (0...@board.length).each do |row|
            if [0,1,6,7].include?(row)
                (0...8).each { |col| @board[row].push Piece.new(self, [row,col], :b)}
            else
                (0...8).each {|col| @board[row].push NullPiece.instance}
            end
        end
    end

    def empty_position(pos)
        return Board.valid_position?(pos) && self[pos] == NullPiece.instance
    end

    def [](pos)
        row, col = pos
        @board[row][col]
    end

    def[]=(pos, value)
        row, col = pos
        @board[row][col] = value
    end

    def move_piece(start_pos, end_pos)
        raise 'No piece there' if self[start_pos].nil?
        raise 'Can\'t move there' unless Board.valid_position?(end_pos)

    end

    attr_accessor :board
end