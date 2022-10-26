module Stepable
    
    def moves
        new_moves = self.move_difs
        new_moves.map! {|dif| [self.pos[0]+dif[0], self.pos[1]+dif[1]]}
        new_moves.select! {|pos| Board.valid_position?(pos)}
        new_moves.reject! {|pos| self.color == self.board[pos].color}
        return new_moves
    end

    private
    def move_difs
        raise 'should be implemented in including class'
    end
    
end