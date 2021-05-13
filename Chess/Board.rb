class Board

    def initialize
        @null_piece = NullPiece.instance
        @grid = Array.new(8) {Array.new(8, @null_piece)}
        set_up_board
        # helper_meth() making the board the default way
    end
    # (color, board, start_pos)
    def set_up_board
        (0...@grid.length).each do |i|
            case i
            when 0
                @grid[i] = set_up_other_pieces(:b, i)
            when 1
                @grid[i] = set_up_pawns(:b, i)
            when 6
                @grid[i] = set_up_pawns(:w, i)
            when 7
                @grid[i] = set_up_other_pieces(:w, i)
            end
        end
    end

    # "case num when" => "if num =="
    
    def set_up_other_pieces(color, row_num) # fills up rows 0 and 7
        [
            Rook.new(color, self, [row_num, 0]) #row_num = 0,7
            Knight.new(color, self, [row_num, 1]) #row_num = 0,7
            Bishop.new(color, self, [row_num, 2]) #row_num = 0,7
            Queen.new(color, self, [row_num, 3]) #row_num = 0,7
            King.new(color, self, [row_num, 4]) #row_num = 0,7
            Bishop.new(color, self, [row_num, 5]) #row_num = 0,7
            Knight.new(color, self, [row_num, 6]) #row_num = 0,7
            Rook.new(color, self, [row_num, 7]) #row_num = 0,7
        ]
    end

    def set_up_pawns(color, row_num) # fills up rows 1 and 6
        (0...8).to_a.map { |i| Pawn.new(color, self, [row_num, i]) }
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @grid[row][col] = val
    end

    def move_piece(color, start_pos, end_pos) # want color so you cant move a piece of the other color
        raise "Invalid position" if !valid_pos?(start_pos) || !valid_pos?(end_pos)
        raise "No piece at starting position" if self[start_pos] == @null_piece
        raise "Not valid move" if !self[start_pos].moves.include?(end_pos)
        raise "Not yo piece fool" if color != self[start_pos].color
        # start_pos array can get instance by getting the grid (self in this case) position

        # start_pos
        # - call valid pos for start pos (needs to be in board)
        # - cant have nothing

        # end_pos
        # - call valid pos for end pos (needs to be in board)
        # - all moves a specific piece can move will be in moves method
        #   as an array. see if array.include(end_pos)
    end

        # if empty, valid
        # if pos is taken,
        #   if color is your own, invalid
        #   elsif color is opponent, valid
        # worry about in the game in phase 2

        # if 0 < pos.length of each pos indices < 8, valid
        # if pos is not possible for piece to move to in one turn, invalid
    def valid_pos?(pos)
        return false if pos.length != 2
        return false if !(0...8).include?(pos[0]) || !(0...8).include?(pos[1])
        true
    end

    def add_piece(piece, pos) #put each indiv piece
        @grid[pos] = piece if valid_pos?(pos)
    end

    # def checkmate?(color)

    # end

    # def in_check?(color)

    # end
 
    def find_king(color) # finds the position of the king
        @grid.each do |row|
            row.each do |col|
                [row,col] = pos
                return pos if @grid[pos] == king.color # king.color might be an issue?
            end
        end
    end

    def pieces
        # this is for adding pieces in default position
        # to populate the board
    end

    def dup
        @grid.dup
    end
#testing repos
    def move_piece!(color, start_pos, end_pos) #mutate if move_piece without! doesnt cause check then call this

    end
end