require "byebug"
require_relative "required_pieces"

class Board

    attr_accessor :board
    attr_reader :white_pieces, :black_pieces
    
    def self.valid_position?(pos)
        pos.all? {|num| num < 8 && num >= 0}
    end

    def self.get_empty_board
        instance = Board.new(true)
        return instance
    end

    def initialize(empty=false)
        @board = Array.new(8) {Array.new(8) {NullPiece.instance}}
        @black_pieces = []
        @white_pieces = []
        populate unless empty
    end

    def populate
        populate_pawns
        populate_kings
        populate_queens
        populate_bishops
        populate_knights
        populate_rooks
    end

    def populate_pawns
        (0..7).each do |col|
            @white_pieces << self[[1,col]] = Pawn.new(self, [1,col], :w)
        end

        (0..7).each do |col|
            @black_pieces << self[[6,col]] = Pawn.new(self, [6,col], :b)
        end
    end

    def populate_rooks

        @white_pieces << self[[0,0]] = Rook.new(self, [0,0], :w)
        @white_pieces << self[[0,7]] = Rook.new(self, [0,7], :w)
        @black_pieces << self[[7,0]] = Rook.new(self, [7,0], :b)
        @black_pieces << self[[7,7]] = Rook.new(self, [7,7], :b)
    end

    def populate_knights
        @white_pieces << self[[0,1]] = Knight.new(self, [0,1], :w)
        @white_pieces << self[[0,6]] = Knight.new(self, [0,6], :w)
        @black_pieces << self[[7,1]] = Knight.new(self, [7,1], :b)
        @black_pieces << self[[7,6]] = Knight.new(self, [7,6], :b)
    end

    def populate_bishops
        @white_pieces << self[[0,2]] = Bishop.new(self, [0,2], :w)
        @white_pieces << self[[0,5]] = Bishop.new(self, [0,5], :w)
        @black_pieces << self[[7,2]] = Bishop.new(self, [7,2], :b)
        @black_pieces << self[[7,5]] = Bishop.new(self, [7,5], :b)
    end

    def populate_queens
        @white_pieces << self[[0,4]] = Queen.new(self, [0,4], :w)
        @black_pieces << self[[7,4]] = Queen.new(self, [7,4], :b)
    end

    def populate_kings
        @white_pieces << self[[0,3]] = King.new(self, [0,3], :w)
        @black_pieces << self[[7,3]] = King.new(self, [7,3], :b)
    end

    def empty_position?(pos)
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
        raise 'No piece there' if self.empty_position?(start_pos)
        piece = self[start_pos]
        moves = piece.moves
        raise 'Can\'t move there' unless Board.valid_position?(end_pos) && moves.include?(end_pos)
        
        @white_pieces.delete(self[end_pos])
        @black_pieces.delete(self[end_pos])
        
        self[start_pos] = NullPiece.instance
        self[end_pos] = piece
        piece.position = end_pos
    end

    def get_king_pos(color)
        if color == :w
            self.white_pieces.each {|piece| return piece.position if piece.kind_of?(King)}
        elsif color == :b
            self.black_pieces.each {|piece| return piece.position if piece.kind_of?(King)}
        end
    end

    def checkmate?
        return false
    end

    def in_check?(color)

    end
end