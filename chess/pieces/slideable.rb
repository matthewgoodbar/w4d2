module Slideable
    DIAGONAL_DIRS = {se:[1,1],sw:[1,-1],ne:[-1,1],nw:[-1,-1]}
    HORIZONTAL_DIRS = {s: [1,0],e: [0,1],n: [-1,0],w: [0,-1]}

    def moves
        possible_moves = []
        possible_moves += diagonal_moves if self.diag?
        possible_moves += horizontal_moves if self.horiz?
    end

    def diagonal_moves
        possible_moves = []
        DIAGONAL_DIRS.each do |dir, dif|
            current_pos = self.position
            new_pos = current_pos + dif
            while self.board.empty_position(new_pos)
                possible_moves << new_pos
                new_pos = new_pos + dif
            end
        end
        return possible_moves
    end

    def horizontal_moves

    end
end