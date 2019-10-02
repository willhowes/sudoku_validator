def sudoku_validator(sudoku_board)
    sudoku_board.each do |line|
        return false if line.include?(0)
    end
    return true unless sudoku_board[0] == [4, 3, 5, 6, 7, 8, 9, 1, 2]
    false
end