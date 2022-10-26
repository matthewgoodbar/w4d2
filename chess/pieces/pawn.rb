require_relative "piece"

class Pawn < Piece
    attr_reader :position, :board, :color
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
        forward_steps
    end

    private
    def at_start_row?
        self.color == :w && self.position[0] == 1 || self.color == :b && self.position[0] == 6
    end

    def forward_dir
        if self.color == :w
            return [-1,0]
        else
            return [1,0]
        end
    end

    def forward_steps
        steps = []
        first_step = [self.position[0] + forward_dir[0], self.position[1]]
        double_step = [self.position[0] + (forward_dir[0]*2), self.position[1]]

        if at_start_row?
            if self.board.empty_position?(first_step) && self.board.empty_position?(double_step)
                steps << first_step
                steps << double_step
            elsif self.board.empty_position?(first_step)
                steps << first_step
            end
        else 
            if self.board.empty_position?(first_step)
                steps << first_step
            end
        end
        steps
    end
end