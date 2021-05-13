class Piece
    # use this class to make instances
    # each instance is a piece
    # each peice has a color, position

    Symbol

    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board # why board? to know where your piece is in relation to other pieces
        @pos = pos
    end

    def to_s(int)
        # int.to_s ???
    end

    def empty?
    end

    def valid_moves?
    end

    def pos=(val)
    end

    def move_into_check?(end_pos)
    end

end