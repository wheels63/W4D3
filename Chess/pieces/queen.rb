class Queen
    include Slideable

    def move_dirs
        diagonal_dirs + horizontal_dirs
    end

end