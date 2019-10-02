# frozen_string_literal: true

def sudoku_validator(board)
  board.each_with_index do |line, line_index|
		return false if any_zeros?(line)
		return false if any_duplicates_row?(line)
		return false if any_duplicates_column?(board, line, line_index)
	end
	return false if any_duplicates_cell?(board)
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

SUDOKU_MATRIX = {
	0 => [0,1,2,9,10,11,18,19,20],
	1 => [3,4,5,12,13,14,21,22,23],
	2 => [6,7,8,15,16,17,24,25,26],
	3 => [27,28,29,36,37,38,45,46,47],
	4 => [30,31,32,39,40,41,48,49,50],
	5 => [33,34,35,42,43,44,51,52,53],
	6 => [54,55,56,63,64,65,72,73,74],
	7 => [57,58,59,66,67,68,75,76,77],
	8 => [60,61,62,69,70,71,78,79,80]
}

def any_duplicates_cell?(board)
	numbers_sudoku_index = {}
	board.flatten.each_with_index do |number, index|
		numbers_sudoku_index[index] = number
	end
	board.flatten.each_with_index do |number, index|
		cell_to_check = 0
		SUDOKU_MATRIX.each do |cell_number, cell_values|
			if SUDOKU_MATRIX[cell_number].include?(index)
				cell_to_check = cell_number
			end
		end
		SUDOKU_MATRIX[cell_to_check].each do |index_to_check|
			if numbers_sudoku_index[index_to_check] == number && index_to_check != index
				return true
			end
		end
	end
	false
end


# if line_index < 7
# 	if num_index < 7
# 		2.times do |i|
# 			p "--------------"
# 			p "NUMBER CHECKING: #{num}"
# 			p "CHECKING AGAINST #{board[line_index + i +1][num_index +1] }"
# 			p "CHECKING AGAINST #{board[line_index + i +1][num_index +2] }"
# 			return true if num == board[line_index + i +1][num_index +1] || num == board[line_index + i +1][num_index +2]
# 		end
# 	elsif num_index == 7
# 		2.times do |i|
# 			return true if num == board[line_index + i +1][num_index +1]
# 		end
# 	end
# end
# if line_index == 7
# 	if num_index < 7
# 		return true if num == board[line_index +1][num_index +1] || num == board[line_index +1][num_index +2]
# 	elsif num_index == 7
# 		return true if num == board[line_index +1][num_index +1]
# 	end
# end
