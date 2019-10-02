def sudoku_validator(sudoku_board)
    sudoku_board.each do |line|
        return false if line.include?(0)
    end
end