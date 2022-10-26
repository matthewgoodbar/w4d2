module Slideable
    DIAGONAL_DIRS = {se:[1,1],sw:[1,-1],ne:[-1,1],nw:[-1,-1]}
    HORIZONTAL_DIRS = {s: [1,0],e: [0,1],n: [-1,0],w: [0,-1]}

    def moves
        possible_moves = []
        possible_moves += get_moves(DIAGONAL_DIRS) if self.diag?
        possible_moves += get_moves(HORIZONTAL_DIRS) if self.horiz?
        return possible_moves
    end

    def get_moves(dir_hash)
        possibles = []
        dir_hash.each do |dir, dif|
            current_pos = self.position
            new_pos = [current_pos[0] + dif[0], current_pos[1] + dif[1]]
            while self.board.empty_position?(new_pos)
                possibles << new_pos
                new_pos = [new_pos[0] + dif[0], new_pos[1] + dif[1]]
            end
            if Board.valid_position?(new_pos)
                possibles << new_pos unless self.board[new_pos].color == self.color
            end
        end
        return possibles
    end

end