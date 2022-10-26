class Player
    CURSOR_COLOR = {1=>:light_red, 2=>:light_blue}

    attr_reader :color, :cursor, :player_num
    def initialize(color, cursor, player_num)
        @color = color
        @cursor = cursor
        @player_num = player_num
    end

    def get_input
        return self.cursor.get_input
    end

    def get_cursor_color
        CURSOR_COLOR[self.player_num]
    end
end