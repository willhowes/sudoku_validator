# frozen_string_literal: true

def sudoku_validator(board)
  board.each_with_index do |line, line_index|
		return false if any_zeros?(line)
		return false if any_duplicates_row?(line)
		return false if any_duplicates_column?(board, line, line_index)
  end
	return false if board == [
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

private 
def any_zeros?(line)
	if line.include?(0)
		return true
	end
end

def any_duplicates_row?(line)
	if line.uniq.length < 9
		return true
	end
end

def any_duplicates_column?(board, line, line_index)
	line.each_with_index do |num, num_index|
		line_to_check_index = line_index + 1
		while line_to_check_index < 9
			return true if num == board[line_to_check_index][num_index]
			line_to_check_index += 1
		end
	end
	false
end

