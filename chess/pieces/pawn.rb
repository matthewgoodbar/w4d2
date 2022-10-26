require_relative "piece"

class Pawn < Piece
    
    def initialize(board, position, color)
        super
    end

    def to_s
        return self.color_piece("Pn")
    end

    def test
        self.at_start_row?
    end

    def moves
        return forward_steps + side_attacks
    end

    private
    def at_start_row?
        self.color == :w && self.position[0] == 1 || self.color == :b && self.position[0] == 6
    end

    def forward_dir
        if self.color == :w
            return 1
        else
            return -1
        end
    end

    def forward_steps
        return forward_steps_at_start if at_start_row?
        res = []
        first_step = [self.position[0] + forward_dir, self.position[1]]
        res << first_step if self.board.empty_position?(first_step)
        return res
    end

    def forward_steps_at_start
        res = []
        first_step = [self.position[0] + forward_dir, self.position[1]]
        second_step = [self.position[0] + (forward_dir * 2), self.position[1]]
        if self.board.empty_position?(first_step)
            res << first_step
            res << second_step if self.board.empty_position?(second_step)
        end
        return res
    end

    def side_attacks
        res = []
        left_attack = [self.position[0] + forward_dir, self.position[1] - 1]
        right_attack = [self.position[0] + forward_dir, self.position[1] + 1]
        attacks = [left_attack, right_attack]
        attacks.each do |attack|
            if Board.valid_position?(attack) && self.board[attack].color == self.opposite_color
                res << attack
            end
        end
        return res
    end
end