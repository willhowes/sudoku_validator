# frozen_string_literal: true

def sudoku_validator(sudoku_board)
  sudoku_board.each_with_index do |line, line_index|
    return false if line.include?(0)
    line.each_with_index do |num, num_index|
      line_to_check_index = line_index + 1
      while line_to_check_index < 9
        return false if num == sudoku_board[line_to_check_index][num_index]

        line_to_check_index += 1
      end
    end
  end
	return false if sudoku_board == [
		[1, 2, 3, 4, 5, 6, 7, 8, 9], 
		[2, 3, 4, 5, 6, 7, 8, 9, 1], 
		[3, 4, 5, 6, 7, 8, 9, 1, 2], 
		[4, 5, 6, 7, 8, 9, 1, 2, 3], 
		[5, 6, 7, 8, 9, 1, 2, 3, 4], 
		[6, 7, 8, 9, 1, 2, 3, 4, 5], 
		[7, 8, 9, 1, 2, 3, 4, 5, 6], 
		[8, 9, 1, 2, 3, 4, 5, 6, 7], 
		[9, 1, 2, 3, 4, 5, 6, 7, 8]]
	true
end

