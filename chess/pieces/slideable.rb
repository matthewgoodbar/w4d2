module Slideable
    DIAGONAL_DIRS = {se:[1,1],sw:[1,-1],ne:[-1,1],nw:[-1,-1]}
    HORIZONTAL_DIRS = {s: [1,0],e: [0,1],n: [-1,0],w: [0,-1]}

    def moves
        possible_moves = []
        possible_moves += diagonal_moves if self.diag?
        possible_moves += horizontal_moves if self.horiz?
        return possible_moves
    end

    def diagonal_moves
        possible_diags = []
        DIAGONAL_DIRS.each do |dir, dif|
            current_pos = self.position
            new_pos = [current_pos[0] + dif[0], current_pos[1] + dif[1]]
            while self.board.empty_position(new_pos)
                possible_diags << new_pos
                new_pos = [new_pos[0] + dif[0], new_pos[1] + dif[1]]
            end
        end
        return possible_diags
    end

    def horizontal_moves

    end
end