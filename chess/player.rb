class Player
    attr_reader :color, :cursor
    def initialize(color, cursor)
        @color = color
        @cursor = cursor
    end

    def get_input
        return self.cursor.get_input
    end
end